class City < ApplicationRecord
  belongs_to :user

  def current_weather_obj 
    return @current_weather_json if @current_weather_json
    api = ENV['OPEN_WEATHER_MAP_API_KEY']
    response = Faraday.get "http://api.openweathermap.org/data/2.5/weather?q=#{name}&appid=#{api}&units=imperial"
    @current_weather_json = JSON::parse(response.body)
  end

  def current_forecast_obj 
    return @current_forecast_json if @current_forecast_json
    api = ENV['OPEN_WEATHER_MAP_API_KEY']
    response = Faraday.get "http://api.openweathermap.org/data/2.5/forecast?q=#{name}&appid=#{api}&units=imperial"
    @current_forecast_json = JSON::parse(response.body)
  end

  def current_temp
    current_weather_obj["main"]
  end  
  def current_weather
    current_weather_obj["weather"][0]
  end

  def filtered_five_day_forecast_list
    current_forecast_obj['list'].select{ |obj| midnight_or_noon(obj['dt_txt'])}
  end

  def midnight_or_noon(time)
    time.include?('0:00:00') || time.include?('12:00:00')
  end
end
