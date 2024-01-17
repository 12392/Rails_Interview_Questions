# Metaprogramming  rails

# Metaprogramming in Ruby on Rails refers to the ability of a program to modify or generate its own code dynamically during runtime. 
# Ruby, the programming language on which Rails is built, is known for its powerful metaprogramming capabilities. 
# Rails itself heavily utilizes metaprogramming to provide features such as ActiveRecord associations, callbacks, and dynamic method generation.

# Here are some common metaprogramming techniques used in Rails:

#s-> Dynamic Method Definition:
# Ruby allows methods to be defined dynamically at runtime using the define_method or class_eval methods. 
# This is often used in Rails for creating methods on-the-fly based on certain conditions

class MyClass
    define_method :dynamic_method do
      puts 'This is a dynamically defined method.'
    end
  end
  
obj = MyClass.new
obj.dynamic_method  

#-> Dynamic Attributes:
# Rails models can dynamically define attributes using methods like attr_accessor, attr_writer, and attr_reader. 
# ActiveRecord, the Rails ORM, utilizes this for attribute accessors.

class User < ApplicationRecord
    attr_accessor :custom_attribute
  end
  
user = User.new
user.custom_attribute = 'Some value'
  

#-> Metaprogramming with method_missing:
# The method_missing method in Ruby allows you to handle method calls that do not match any existing method.
# This can be used for dynamic method dispatching or handling unknown methods.
class DynamicDispatcher
  def method_missing(method_name, *args, &block)
    puts "Calling method: #{method_name}"
  end
end

obj = DynamicDispatcher.new
obj.unknown_method # Prints "Calling method: unknown_method"

#-> send and public_send:
# The send and public_send methods in Ruby allow you to invoke a method dynamically by providing its name as a symbol. 
# This is often used for dynamic method invocation, especially in Rails controllers.
class SampleController < ApplicationController
  def dynamic_action
    puts 'This is a dynamically invoked action.'
  end

  def call_dynamic_action
    send(:dynamic_action)
  end
end

#-> Class Macros and Class Methods:
# Rails uses class macros and class methods extensively. These are methods that are defined on the class itself and 
# can be used to configure or extend the behavior of the class.

class MyModel < ApplicationRecord
  validates_presence_of :name

  # The 'validates_presence_of' is a class macro
end

#-> Reflection:
# Rails provides reflection methods that allow you to introspect and manipulate classes, modules, and objects dynamically. 
# For example, Class#ancestors and Object#methods are reflection methods.

class MyClass
end

obj = MyClass.new
puts obj.class.ancestors

# Metaprogramming in Rails is a powerful tool but should be used judiciously. 
# It can make code more concise and flexible but may also make it harder to understand and maintain if overused or misused. 
# It's important to strike a balance between flexibility and readability when employing metaprogramming techniques.
