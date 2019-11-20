require "byebug"
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    unless @columns
      query = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{table_name}
      SQL
      @columns ||= query[0].map(&:to_sym)
    end
    @columns
  end

  # Now we can finally write ::finalize!. It should iterate through all the ::columns, using define_method (twice) to create a getter and setter method for each column, just like my_attr_accessor. But this time, instead of dynamically creating an instance variable, store everything in the attributes hash.

  def self.finalize!
    self.columns.each do |column|
      define_method("#{column}=") do |value = 0|
        self.attributes[column] = value
      end
      define_method(column) do 
        self.attributes[column]
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    DBConnection.execute(<<-SQL)
        SELECT
          *
        FROM
          #{table_name}
      SQL
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  # Your #initialize method should iterate through each of the attr_name, value pairs. For each attr_name, it should first convert the name to a symbol, and then check whether the attr_name is among the columns. If it is not, raise an error:

  def initialize(params = {})
    params.each do |a, v|
      a_sym = a.to_sym
      if !self.class.columns.include?(a_sym)
        raise "unknown attribute '#{a_sym}'"
      else
        self.send(a_sym)
        self.send("#{a_sym}=", v)
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
