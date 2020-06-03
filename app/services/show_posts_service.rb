class ShowPostsService < BaseService
    def initialize(args)
    end

    def call
        return Post.all
    end

    # private
    # attr_accessor
end