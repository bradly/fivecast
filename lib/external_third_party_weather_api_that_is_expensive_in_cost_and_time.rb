module ExternalThirdPartyWeatherApiThatIsExpensiveInCostAndTime
  module Api
    class Client
      # TODO:
      # - Wire up to actual weather service
      # - Add backoff retry failed http requests
      # - Handle JSON parsing errors

      def initialize(zipcode:)
        @zipcode = zipcode
      end

      def data
        {
          current_temp: rand(0..100),
          unit: "F"
        }
      end
    end
  end
end
