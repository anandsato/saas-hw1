class Class
  def attr_accessor_with_history attr_name
    @attr_name = attr_name.to_s   # make sure it's a string
    attr_reader @attr_name        # create the attribute's getter
    attr_reader @attr_name+"_history" # create bar_history getter
    @definition = %Q{
      def initialize
        @history_hash = Hash.new [nil]
        @history_hash["#{@attr_name}"] = Array.new << nil
      end

      def #{@attr_name}= arg1
        @history_hash["#{@attr_name}"] << arg1
      end

      def #{@attr_name}_history
        @history_hash["#{@attr_name}"]
      end
    }
    class_eval @definition
  end
end

class Foo
    attr_accessor_with_history :bar
    attr_accessor_with_history :bar2
end

class CS169
    attr_accessor_with_history :name
    attr_accessor_with_history :year
end

puts

f = Foo.new     # => #<Foo:0x127e678>
f.bar = 3       # => 3
f.bar = :wowzo  # => :wowzo
f.bar = 'boo!'  # => 'boo!'
p f.bar_history   # => [nil, 3, :wowzo, 'boo!']

puts

cs169 = CS169.new
cs169.name = "Armando Fox"
cs169.year = 2011
cs169.name = "Sergey Roach"
cs169.year = 2012

p cs169.name_history
p cs169.year_history

puts

f = Foo.new
f.bar = 1
f.bar = 2
f = Foo.new
f.bar = 4
p f.bar_history

puts

k = Foo.new
p k.bar_history