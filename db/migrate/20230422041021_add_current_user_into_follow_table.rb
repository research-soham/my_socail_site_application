class AddCurrentUserIntoFollowTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :follows, :current_account, foreign_key: {to_table: :accounts}
  end
end
