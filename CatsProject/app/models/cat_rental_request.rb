class CatRentalRequest < ActiveRecord::Base
  STATUSES = ["PENDING","DENIED","APPROVED"]
  validates :start_date, :end_date, :cat_id, presence: true
  #validates :status, uniqueness: {scope: :cat_id}
  validates :status, inclusion: STATUSES
  before_create :default_status

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def self.all_statuses
    STATUSES
  end

  def overlapping_requests
    CatRentalRequest
      .where(cat_id: self.cat_id)
      .where('(start_date BETWEEN ? AND ? OR end_date BETWEEN ? AND ?) OR (start_date <= ? AND end_date >= ?)',
     start_date, end_date, start_date, end_date, start_date, end_date)
  end

  def approved_overlapping_requests
    overlapping_requests.where(status: "APPROVED")
  end

  private
  def default_status
    self.status = "PENDING" if self.status.nil?
  end
end
