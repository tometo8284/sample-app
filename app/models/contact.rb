class Contact < ApplicationRecord
  validates :name, presence: true
  validates :message, presence: true
  enum subject: { inquiry: 0, report: 1 }
end
