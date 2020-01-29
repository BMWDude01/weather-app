class City < ApplicationRecord
  belongs_to :user

  def current_weather_obj

    api = ENV['OPEN_WEATHER_MAP_API_KEY']
    response = Faraday.get "http://api.openweathermap.org/data/2.5/weather?q=#{name}&appid=#{api}&units=imperial"
    json = JSON::parse(response.body)
    # current_temp = json['main']['temp']
  end
end
