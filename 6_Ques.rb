# validations and callbacks

# validations

# Validations are used to ensure that the data saved to the database meets specific criteria. 
# They are declared in the model classes and run automatically when you try to save an object. 
# If a validation fails, the object won't be saved, and an error will be added to the object's errors collection

# Common Validations:

# -> Presence Validation:
# Ensures that a particular attribute is not blank.
class User < ApplicationRecord
    validates :name, presence: true
end

# ->Length Validation:
# Enforces the length of a string attribute.
class Post < ApplicationRecord
    validates :title, length: { minimum: 5 }
end

# ->Format Validation:
# Validates the format of an attribute using a regular expression.
class EmailSubscriber < ApplicationRecord
    validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email format" }
end
  

# ->Uniqueness Validation:
# Ensures that a particular attribute's value is unique across the records in the database
class Product < ApplicationRecord
    validates :name, uniqueness: true
end





# Callbacks:

# Callbacks are methods that get called at certain points in the life cycle of an Active Record object. 
# They allow you to perform actions in response to various events, such as before or after validation, before or after saving, and so on.


# Common Callbacks:
# -> Before Validation:
# Runs before validation.
class Order < ApplicationRecord
    before_validation :set_defaults
  
    private
  
    def set_defaults
      # Set default values before validation
    end
end


#-> After Validation:
# Runs after validation.
class Comment < ApplicationRecord
    after_validation :normalize_content
  
    private
  
    def normalize_content
      self.content = content.downcase
    end
end

#-> Before Save:
# Runs before a record is saved
class Article < ApplicationRecord
    before_save :calculate_word_count
  
    private
  
    def calculate_word_count
      self.word_count = content.split.size
    end
end


#-> After Save:
# Runs after a record is saved.
class Order < ApplicationRecord
    after_save :send_confirmation_email
  
    private
  
    def send_confirmation_email
      # Logic to send confirmation email
    end
end



# Rails provides a rich set of both built-in validations and callbacks, making it easy to enforce data integrity 
# and execute custom logic at different points in the life cycle of your models. 
# Choose the appropriate validations and callbacks based on your application's requirements.
