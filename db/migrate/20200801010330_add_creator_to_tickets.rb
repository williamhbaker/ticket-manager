class AddCreatorToTickets < ActiveRecord::Migration[6.0]
  def change
    change_table :tickets do |t|
      t.belongs_to :user
    end
  end
end
