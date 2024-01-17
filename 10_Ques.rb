# Irreversible Migration  Rails


# In Ruby on Rails, an irreversible migration refers to a type of database migration that cannot be rolled back. 
# This is typically used when making changes to the database schema that are intended to be permanent and cannot be undone. 
# Irreversible migrations are often used for actions that involve data loss or changes that cannot be automatically reversed.

# When you generate a migration in Rails, you can use the reversible method to specify both up and down actions, 
# making the migration reversible. However, there are situations where certain changes are irreversible, 
# and you want to make it clear that rolling back the migration is not supported.

# Here's an example of how to create an irreversible migration
class AddColumnToUsers < ActiveRecord::Migration[6.1]
    def up
      # Add a new column
      add_column :users, :new_column, :string
    end
  
    def down
      # This action is not defined, indicating that the migration is irreversible
      raise ActiveRecord::IrreversibleMigration, "Can't reverse this migration"
    end
end


# By raising an ActiveRecord::IrreversibleMigration exception, you are telling Rails that rolling back this migration is 
# not supported, and attempting to do so will result in an error.

# It's important to use irreversible migrations with caution, and only in cases where you are certain that the changes made are permanent 
# and cannot be undone. This is especially relevant when data is being altered or deleted, as irreversible migrations 
# can lead to data loss if not handled carefully. Always document irreversible migrations thoroughly to make sure that developers 
# are aware of the potential consequence
