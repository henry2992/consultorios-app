class HistoryEntry < ApplicationRecord
	belongs_to :history
	has_many :attachments, as: :imageable
end
