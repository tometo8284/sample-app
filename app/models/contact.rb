class Contact < ApplicationRecord
  enum subject: { inquiry: 0, report: 1 }
end
