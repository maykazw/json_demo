module GetData
  class GetDataFromUrlService < BaseService
    def initialize(args)
      @logger = Logger.new(STDOUT)
      self.params_url = args.fetch(:url)
      self.url = URI(params_url)
    end

    def call
      begin
        url = URI.parse(params_url)
      rescue URI::InvalidURIError => err
        @logger.debug { "Error from api: InvalidURIError" }
        return {status: 400, errors: 'InvalidURIError'}
      end

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      request = Net::HTTP::Get.new(url)
      request["Accept"] = "application/json"
      response = https.request(request)
      if response.kind_of? Net::HTTPSuccess
        begin
          list = JSON.parse(response.read_body)
          return {status: 'success', response: list}
        rescue ActiveSupport::JSON.parse_error
          @logger.debug { "Error from api: " + response.read_body.to_s }
          return {status: 400, errors: response.read_body.to_s }
        end
      else
        @logger.debug { "Error from api: " + response.read_body.to_s }
        return {status: 400, errors: response.read_body.to_s }
      end
    end

    private

    attr_accessor :url, :params_url
  end
end