class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :park_id
      t.string :park
      t.string :activity

      t.timestamps
    end
  end
end
