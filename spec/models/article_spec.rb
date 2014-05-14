require 'spec_helper'

describe Article do
  
  it "has a valid factory" do
    FactoryGirl.create(:article).should be_valid
  end

  it "is invalid without a title" do
    FactoryGirl.build(:article, title: "").should_not be_valid
  end

  it "is invalid witout content" do
    FactoryGirl.build(:article, content: "").should_not be_valid
  end

  it "is valid without a subtitle" do
    FactoryGirl.build(:article, subtitle: "").should be_valid
  end

  it "returns json after creation"

end