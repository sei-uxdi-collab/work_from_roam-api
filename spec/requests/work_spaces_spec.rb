require 'rails_helper'

RSpec.describe "WorkSpaces", type: :request do
  describe "GET /work_spaces" do
    it "works! (now write some real specs)" do
      get work_spaces_path
      expect(response).to have_http_status(200)
    end
  end
end
