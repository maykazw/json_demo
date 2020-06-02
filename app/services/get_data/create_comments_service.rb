module GetData
  class CreateCommentsService < BaseService
    def initialize(args)
      self.comments_data = args.fetch(:comments_data)
    end

    def call
        ActiveRecord::Base.transaction do
          comments_data.each do |comment_data|
            begin
            post_data = Comment.find_or_create_by!(external_uuid: comment_data[:id]) do |post|
              post.name = comment_data[:name]
              post.body = comment_data[:body]
              post.email = comment_data[:email]
              post.post_id = comment_data[:postId]
            end
            rescue ActiveModel::ValidationError => exception
              return {status: "errors", error_no: 422, response: exception.errors}
            end
          end
          return {status: "success", response: "created"}
        end
    end

    private

    attr_accessor :comments_data
  end
end