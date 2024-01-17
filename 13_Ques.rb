# send() and public_send() 

# In Ruby, including Rails, send and public_send are methods that allow you to dynamically invoke methods on an object. 
# They are commonly used in metaprogramming scenarios and are part of Ruby's reflection capabilities.

#-> send Method:
# The send method is a versatile method that can be used to invoke any method on an object, including private methods. 
# It takes the method name as its first argument and any arguments to pass to the method as subsequent arguments.

class MyClass
  def greeting(name)
    "Hello, #{name}!"
  end
end

obj = MyClass.new
result = obj.send(:greeting, "John")
puts result
# Output: Hello, John!
# In this example, send is used to dynamically invoke the greeting method on the obj object.

#-> public_send Method:
# The public_send method is similar to send, but it restricts the invocation to public methods.
# If you try to invoke a private or protected method using public_send, it will raise an exception.

class MyClass
  private

  def private_greeting(name)
    "Private hello, #{name}!"
  end
end

obj = MyClass.new

# This will raise a NoMethodError because private methods cannot be called with public_send
result = obj.public_send(:private_greeting, "John")




#->  Example Use Case in Rails Controllers:
# In Rails controllers, send and public_send can be used to dynamically invoke actions based on parameters or conditions.

class MyController < ApplicationController
  def action_one
    # ...
  end

  def action_two
    # ...
  end

  def dynamic_action
    action_name = params[:action_name]
    if respond_to?(action_name) && action_name.start_with?('action_')
      send(action_name)
    else
      render plain: 'Invalid action', status: :bad_request
    end
  end
end

# In this example, the dynamic_action method uses send to dynamically invoke an action based on the value of the action_name parameter.
# While send and public_send can be powerful tools, it's important to use them with care and consider alternative approaches 
# if they make the code overly complex or less maintainable.
