class VisitDetail < ActiveRecord::Base

  scope :today, -> { where("visit_details.created_at >= ? and visit_details.created_at <= ?", Date.today.beginning_of_day, Date.today.end_of_day) }

  belongs_to :visit
end
