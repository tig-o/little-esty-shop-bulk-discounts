require 'httparty'

class HolidayService

    def api_endpoint
        get_url("https://date.nager.at/api/v3/NextPublicHolidays/US")
    end

    def get_url(url)
        response = HTTParty.get(url)
        JSON.parse(response.body, symbolize_names: true)
    end
end


# #
# Code	Details
# 200	
# Response body
# Download
# [
#   {
#     "date": "2022-09-05",
#     "localName": "Labor Day",
#     "name": "Labour Day",
#     "countryCode": "US",
#     "fixed": false,
#     "global": true,
#     "counties": null,
#     "launchYear": null,
#     "types": [
#       "Public"
#     ]
#   },
#   {
#     "date": "2022-10-10",
#     "localName": "Columbus Day",
#     "name": "Columbus Day",
#     "countryCode": "US",
#     "fixed": false,
#     "global": false,
#     "counties": [
#       "US-AL",
#       "US-AZ",
#       "US-CO",
#       "US-CT",
#       "US-DC",
#       "US-GA",
#       "US-ID",
#       "US-IL",
#       "US-IN",
#       "US-IA",
#       "US-KS",
#       "US-KY",
#       "US-LA",
#       "US-ME",
#       "US-MD",
#       "US-MA",
#       "US-MS",
#       "US-MO",
#       "US-MT",
#       "US-NE",
#       "US-NH",
#       "US-NJ",
#       "US-NM",
#       "US-NY",
#       "US-NC",
#       "US-OH",
#       "US-OK",
#       "US-PA",
#       "US-RI",
#       "US-SC",
#       "US-TN",
#       "US-UT",
#       "US-VA",
#       "US-WV"
#     ],
#     "launchYear": null,
#     "types": [
#       "Public"
#     ]
#   },
#   {
#     "date": "2022-11-11",
#     "localName": "Veterans Day",
#     "name": "Veterans Day",
#     "countryCode": "US",
#     "fixed": false,
#     "global": true,
#     "counties": null,
#     "launchYear": null,
#     "types": [
#       "Public"
#     ]
#   },