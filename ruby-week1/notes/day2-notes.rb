# === Objcts
# every object has an id:
p "string".object_id != "string".object_id
# symbols are a way of refferring to the same
# object:
p :string.object_id == :string.object_id

# * Symbols and hashes for function params
# side note:
# in ruby < 2 you cannot have named parameters
# so you use a hash
def tell_the_truth(options={})
  if options[:profession] == :lawyer
    "it could be believed that this was almost certaily not false."
  else
    true
  end
end

p tell_the_truth(:profession => :lawyer)

# === BLOCKS
# with blocks comes great power

# adding a my_times method
# to Fixnum
class Fixnum
  def my_times
    i = self
    while i > 0
      i = i - 1
      yield
    end
  end
end

3.my_times {puts "draggy dog"}

def wrapper
  puts "== before yield"
  yield
  puts "== after yield"
end

wrapper do
  puts "within yielded block"
end

# blocks in action:
class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new("Ruby", [Tree.new("reia", [Tree.new("foo"), Tree.new("bar")]), Tree.new("MacRuby")])

puts "visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

# === Classes
# structure
p "4.class: #{4.class}"
# => FixNum
p "4.class.superclass: #{4.class.superclass}"
# => Integer
p "4.class.superclass.superclass: #{4.class.superclass.superclass}"
# => Numeric
p "4.class.superclass.superclass.superclass: #{4.class.superclass.superclass.superclass}"
# => Object
p "4.class.superclass.superclass.superclass.superclass: #{4.class.superclass.superclass.superclass.superclass}"
# => BasicObject
# this evaluates to BasicObject (which is a building block for objects
# that want to exist outside of the ruby kernel which is mixed in to Object)

p "4.class.class: #{4.class.class}"
# => Class
p "4.class.class.superclass: #{4.class.class.superclass}"
# => Module

# === Modules
module ToFile
  def filename
    "object_#{self.object_id}.txt"
  end

  def to_f
    File.open(filename, "w") {|f| f.write(to_s)}
  end
end

class Person
  include ToFile
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

Person.new("matz").to_f

