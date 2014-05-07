module ActsAsCSv

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods

    include Enumerable

    def read
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)

      @headers = file.gets.chomp.split(', ')
      @rows = []

      file.each do |row|
        @rows << CsvRow.new(@headers, row.chomp.split(', '))
      end
    end

    attr_accessor :headers, :rows

    def initialize
      read
    end

    def each(&block)
      @rows.each(&block)
    end
  end

  class CsvRow
    def method_missing(row_name, *args)
      row = row_name.to_s
      @contents[row]
    end

    def initialize(headers, row)
      # Rubyists, forgive me,
      # I know not what I do
      @contents = Hash[*headers.zip(row).flatten]
    end
  end
end

class RubyCsv
  include ActsAsCSv
  acts_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row.one}
