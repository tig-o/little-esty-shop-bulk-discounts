require './lib/holiday_service'

class HolidayCalendarSearch

    def holiday_info
        service.api_endpoint.first(3).map
    end

    def service
        HolidayService.new
    end
end