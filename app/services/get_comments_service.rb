class GetCommentsService < BaseService
    def initialize(args)
        self.id = args.fetch(:id)
    end

    def call
        return Comment.where(:post_id=>id)
    end

    private

    attr_accessor :id
end