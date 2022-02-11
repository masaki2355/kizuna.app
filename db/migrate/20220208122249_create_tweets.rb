class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :schoolyear, null: false
      t.string :event, null: false

      t.timestamps
    end
  end
end
