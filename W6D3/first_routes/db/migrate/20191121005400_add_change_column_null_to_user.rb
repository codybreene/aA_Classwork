class AddChangeColumnNullToUser < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:users, :username, false, 'Bob')
  end
end