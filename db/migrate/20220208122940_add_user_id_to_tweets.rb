class AddUserIdToTweets < ActiveRecord::Migration[6.1]
  def up
    execute 'DELETE FROM tweets;'
    add_reference :tweets, :user, null: false, index: true
  end

  def down
    remove_reference :tweets, :user, index:true
  end
end
