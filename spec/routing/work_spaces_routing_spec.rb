require "rails_helper"

RSpec.describe WorkSpacesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/work_spaces").to route_to("work_spaces#index")
    end


    it "routes to #show" do
      expect(:get => "/work_spaces/1").to route_to("work_spaces#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/work_spaces").to route_to("work_spaces#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/work_spaces/1").to route_to("work_spaces#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/work_spaces/1").to route_to("work_spaces#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/work_spaces/1").to route_to("work_spaces#destroy", :id => "1")
    end

  end
end
