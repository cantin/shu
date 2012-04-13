Time::DATE_FORMATS[:default] = "%Y-%m-%d %H:%M:%S"

class ActiveSupport::TimeWithZone
  def as_json(options = {})
    strftime('%Y-%m-%d %H:%M:%S')
  end
end
