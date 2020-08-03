class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :ticket
      t.belongs_to :user
      t.string :body
      t.timestamps
    end
  end
end
