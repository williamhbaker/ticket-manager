class RemoveUserIdFromTickets < ActiveRecord::Migration[6.0]
  def change
    change_table :tickets do |t|
      t.remove :user_id
    end
  end
end
