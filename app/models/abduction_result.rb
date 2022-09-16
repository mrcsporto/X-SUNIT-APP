class AbductionResult < ApplicationRecord
  belongs_to :survivor
  belongs_to :report
  before_save :filter_abducteds
end
