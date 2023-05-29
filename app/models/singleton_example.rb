# The Singleton design pattern is a creational pattern that restricts the instantiation of a class to a single instance 
# Provides a global point of access to that instance. 
# It ensures that a class has only one instance throughout the lifetime of an application and provides a way to access that instance from anywhere in the codebase.

class SingletonExample
  attr_reader :some_data

  private_class_method :new # Making the constructor private

  @@instance = nil

  def self.instance
    if @@instance.nil?
      @@instance = new
    end
    @@instance
  end

  def initialize
    @some_data = "This is some data"
  end
end

#second way
require 'singleton'

class SingletonExample
  include Singleton

  def message
    "Hello from SingletonExample!"
  end
end

# singleton_instance = SingletonExample.instance
# puts singleton_instance.some_data 
# another_instance = SingletonExample.new 