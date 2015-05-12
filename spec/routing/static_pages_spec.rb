require "rails_helper"

describe StaticPagesController, :type => :routing do
  describe "routing" do

    it "routes to #home" do
      expect(:get => "/").to route_to("static_pages#home")
    end

    it "routes to #status" do
      expect(:get => "/status").to route_to("static_pages#status")
    end

    it "routes to #console" do
      expect(:get => "/console").to route_to("static_pages#console")
    end
  end
end
