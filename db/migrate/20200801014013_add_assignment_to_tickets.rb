class AddAssignmentToTickets < ActiveRecord::Migration[6.0]
  def change
    change_table :tickets do |t|
      t.references :creator
      t.references :assigned_to
    end

    add_foreign_key :tickets, :users, column: :creator_id, primary_key: :id
    add_foreign_key :tickets, :users, column: :assigned_to_id, primary_key: :id
  end
end
