module CitiesHelper
  # if code==500, then return "cloud-rain"
  # if code==505, then return "cloud-rain"
  # if code==800, then return "cloud"
  def icon_name_for_code(code)
    if code >= 200 && code < 300
      return "bolt"
    end
    if code >= 300 && code < 400
      return "cloud-rain"
    end
    if code >=500 &&code<600
      return "cloud-showers-heavy"
    end

    if code >=600 &&code<700
      return "snowflake"
    end
    if code >= 700 && code < 800
      return "smog"
    end
    if code == 800
      return "sun"
    end
    if code >= 801 && code < 900
      return "cloud"
    end
  end

  def icon_for_name(icon_name)
     "<i class='fa fa-#{icon_name}'></i>"
   end

  def icon_for_code(code)
    name = icon_name_for_code(code)
    icon_for_name(name)
  end

  def pretty_name_for_dt(dt)
    time = DateTime.strptime(dt.to_s,'%s')
    time.strftime("%A %p")
  end
end
