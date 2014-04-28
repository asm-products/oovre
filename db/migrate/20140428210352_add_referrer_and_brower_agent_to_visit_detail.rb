class AddReferrerAndBrowerAgentToVisitDetail < ActiveRecord::Migration
  def change
    add_column :visit_details, :referrer, :string
    add_column :visit_details, :user_agent, :string
  end
end
