class Follow < ApplicationRecord
  belongs_to :account, class_name: 'Account', foreign_key: 'account_id'
  belongs_to :current_user, class_name: 'Account', foreign_key: 'current_account_id'

end
