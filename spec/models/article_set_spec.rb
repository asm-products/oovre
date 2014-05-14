require 'spec_helper'

describe ArticleSet do

  it "has a valid factory" do
    FactoryGirl.create(:article_set).should be_valid
  end

  describe "FUCK THIS" do
    pending
  end

end