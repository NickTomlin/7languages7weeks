# === Find
# * opening a file without a codeblock
notes = File.open("foo.txt")
notes.close

# * opening a file with a codeblock
File.open("foo.txt", "r") do |f|
  # Ruby automatically closes the file
  # after this block is done executing
  # how nice.
end

# * Translate hash to array
# and back
hash = {foo: 0, bar: 1, baz: 2}
hash_as_array =  hash.to_a
back_to_hash = Hash[hash_as_array]

# for non standard arrays [[k,v]] (via SO) http://stackoverflow.com/a/4028362
# back_to_hash_two = Hash[*hash_as_array]
# or, in ruby 2.1
# [[:key0, value][:key1, value]].to_h

# Can you iterate through a hash?
puts "=== iterating over a hash"
hash.each {|k,v| p "#{k} #{v}" }

# === Do
# ** print the contents of an array of sixteen numbers, four numbers
# at a time, using just each. Now, do the same with each_slice in Enumerable
a = (1..16).to_a

# I struggled with this one a bit actually :\
# - Solution 1
bucket = []
bucket_size = 4
a.each do |n|
  bucket << n
  if bucket.length == bucket_size
    p bucket
    bucket = []
  end
end
# - Solution 2
# a = (1..16).to_a
# a.each {|x| p a.pop(4) }
#
# - Solution 3
# a.each do |x|
#  p a.slice!(-4..-1)
# end

# ** do so using Enumerable#each_slice
# much better...
a.each_slice(4) {|x| p x}

# ** let the tree initializer accept a nested strcture with hashes and arrays
class Tree
  attr_accessor :children, :node_name

  def initialize(structure)
    structure.each do |name, children|
      @node_name = name
      @children = children.map do |x|
        self.class.new(Hash[*x])
      end
    end
  end

  def visit_all(&block)
    visit(&block)
    children.each {|c| c.visit_all(&block)}
  end

  def visit(&block)
    block.call self
  end
end

family = {
  "grandpa" => {
    "dad" => {
      "child 1" => {},
      "child 2" => {}
    },
    "uncle" => {
      "child 3" => {},
      "child 4" => {}
    }
  }
}

family_tree = Tree.new(family)
family_tree.visit_all {|node| puts node.node_name}

# ** Write a simple grep
module Grepper
  def self.grep(file_name, phrase)
    @file_name = file_name
    @phrase_regex = Regexp.new(phrase)

    matches = []
    File.open(@file_name).readlines.each_with_index do |line, line_number|
      if line.scan(@phrase_regex)
        matches << Match.new(line_number, line)
      end
    end

    matches
  end

  class Match
    attr_accessor :line_number, :line

    def initialize(line_number, line)
      @line_number = line_number
      @line = line
    end

    def to_s
      "#{@line_number}: #{@line}"
    end
  end
end

p Grepper.grep('foo.txt', 'baz')
