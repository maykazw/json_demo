class User < ApplicationRecord
has_one :user_address
has_one :user_company
end
