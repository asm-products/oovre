class Visit < ActiveRecord::Base

    belongs_to :visitable, :polymorphic => true
    has_many :visit_details

    def self.track(obj, request)
      visit = Visit.find_or_create_by(visitable_id: obj.id, visitable_type: obj.class.name)
      unless VisitDetail.find_by_visit_id_and_ip_address(visit.id, request.remote_ip)
        visit.increment!(:unique_visits)
      end
      visit.increment!(:total_visits)
      visit_detail = visit.visit_details.create(
        :ip_address => request.remote_ip, 
        :referrer => request.env["HTTP_REFERER"], 
        :user_agent => request.env["HTTP_USER_AGENT"]
      )
    end

end
