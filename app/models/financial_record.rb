class FinancialRecord < ApplicationRecord
  belongs_to :user
  enum :record_type, {:income=>0, :expense=>1}
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :record_type, presence: true
  validates :category, presence: true
  validates :date, presence: true

  scope :by_record_type, ->(record_type) { where(record_type: record_type) if record_type.present? }
  scope :by_category, ->(category) { where(category: category) if category.present? }
  scope :by_date_range, ->(start_date, end_date) { where(date: start_date..end_date) if start_date.present? && end_date.present? }
end
