class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :tags_tickets do |t|
      t.belongs_to :tag
      t.belongs_to :ticket
      t.timestamps
    end
  end
end
