module GetData
  class CreatePostsService < BaseService
    def initialize(args)
      self.posts_data = args.fetch(:posts_data)
    end

    def call
        ActiveRecord::Base.transaction do
          posts_data.each do |post_data|
            begin
            Post.find_or_create_by!(external_uuid: post_data[:id]) do |post|
              post.name = post_data[:title]
              post.body = post_data[:body]
              post.user_id = post_data[:userId]
            end
            rescue ActiveModel::ValidationError => exception
              return {status: "errors", error_no: 422, response: exception.errors}
            end
          end
          return {status: "success", response: "created"}
        end
    end

    private

    attr_accessor :posts_data
  end
end