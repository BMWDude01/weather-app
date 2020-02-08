require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  it "should successfully get the index page" do
    get :index
    assert_response :success
  end

  it "should successfully get the show page" do
    user = User.create!(email: "kai.langrehr@gmail.com", password: "1097634")
    city = user.cities.create!(name: 'Tucson', state: 'Arizona')
    get :show, params: { id: city.id }
    assert_response :success
  end
end
