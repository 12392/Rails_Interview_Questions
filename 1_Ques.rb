# In Ruby on Rails, callbacks are methods that get called at certain points in the life cycle of an Active Record object.
# They allow you to trigger custom logic before or after specific events, such as creating, updating, or destroying a record. 
# Two commonly used callbacks are after_commit and after_save. Let's explore their differences:

# 1) after_save:

#-> The after_save callback is triggered after an object is saved to the database,
# whether it's a new record or an existing record that has been updated.

#-> It runs after the database transaction has been completed but before the response is sent back to the client.

class Post < ApplicationRecord
    after_save :do_something
  
    private
  
    def do_something
      # Custom logic to be executed after the record is saved
    end
end


# 2) after_commit:

#-> The after_commit callback is triggered after the entire database transaction has been completed successfully. 
# This means that the changes made to the object have been persisted to the database, and there is no chance of a rollback.

#-> It is generally used when you need to perform actions that should only occur if the database transaction is guaranteed to be successful.

class Post < ApplicationRecord
    after_commit :do_something
  
    private
  
    def do_something
      # Custom logic to be executed after the record is committed to the database
    end
end


# Differences:

#-> The key difference between after_save and after_commit is the timing of when the callback is executed in relation to the database transaction.

#-> after_save runs after the save operation but before the transaction is committed, 
# which means there is a possibility of a rollback if an error occurs after the save.

#-> after_commit runs after the transaction is successfully committed, ensuring that the changes are persisted in the database.

# In summary, choose between after_save and after_commit based on your specific requirements. 
# If you need to perform actions that should only occur if the database transaction is successful, use after_commit. 
# If you want to execute logic after the object is saved but before the transaction is committed, use after_save.


# after_create is only called when creating an object
