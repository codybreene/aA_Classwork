class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :name, presence: true
      t.text :email, presence: true, unique: true
      t.timestamps
    end
  end
end
