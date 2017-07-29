class BalanceSheet < ApplicationRecord
  include PgSearch
  
  has_many :balance_sheet_entries
  belongs_to :clinic

  validates :title, :start_at, :ends_at, :clinic_id, presence: true
  validates_datetime :start_at, :ends_at
  validates_datetime :ends_at, :after => :start_at, :if => :start_at

  
  pg_search_scope :by,
    :against => [:title, :start_at, :ends_at],
    :using => {
      :tsearch => {:prefix => true, :any_word => true}
    }

end
