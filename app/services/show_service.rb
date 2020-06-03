class ShowService < BaseService
    def initialize(args)
    end

    def call
        return Post.all
    end

    private

    attr_accessor :url, :params_url
end