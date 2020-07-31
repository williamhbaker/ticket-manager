class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.belongs_to :project
      t.string :name
      t.string :body
      t.string :status
      t.timestamps
    end
  end
end
