module GetData
  class CreateUsersService < BaseService
    def initialize(args)
      self.users_data = args.fetch(:users_data)
    end

    def call
        ActiveRecord::Base.transaction do
          users_data.each do |user_data|
            begin
            address_from_api = user_data[:address]
            company_from_api = user_data[:company]
            user = User.find_or_create_by!(email: user_data[:email]) do |user|
              user.name = user_data[:name]
              user.username = user_data[:username]
              user.phone = user_data[:phone]
              user.website = user_data[:website]
            end
            UserAddress.find_or_create_by!(user_id: user.id) do |address|
              address.street = address_from_api[:street]
              address.city = address_from_api[:city]
              address.suite = address_from_api[:suite]
              address.zipcode = address_from_api[:zipcode]
              address.geo_lat = address_from_api[:geo][:lat]
              address.geo_lng = address_from_api[:geo][:lng]
            end
            UserCompany.find_or_create_by!(user_id: user.id) do |company|
              company.name = company_from_api[:name]
              company.catch_phrase = company_from_api[:catchPhrase]
              company.bs = company_from_api[:bs]
            end

          rescue ActiveRecord::RecordInvalid => exception
            return {status: "errors", error_no: 422, response: exception.errors}
          end
          end
          return {status: "success", response: "created"}
        end
    end

    private

    attr_accessor :users_data
  end
end