require "rails_helper"
RSpec.describe CitiesHelper, :type => :helper do
  describe "weather_code_to_icon" do
    it "returns returns cloud-rain for 5xx codes" do
      (500...600).each do |i|
        expect(helper.icon_name_for_code(i)).to eq("cloud-showers-heavy")
      end
    end

    it "returns returns snowflake for 6xx codes" do
      (600...700).each do |i|
        expect(helper.icon_name_for_code(i)).to eq("snowflake")
      end
    end
  end
end