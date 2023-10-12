class ListComment < ApplicationRecord
  belongs_to :user
  belongs_to :lis
end
