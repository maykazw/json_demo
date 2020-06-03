class ShowController < ApplicationController
  def index
    @get_data = ShowService.call()
    respond_to do |format|
      format.html
      format.json { render json: @get_data,serializer: PostSerializer }
    end
  end



  def comments
    @comments = GetCommentsService.call(params_comments)
  end


  private
  def params_comments
    params.require(:id)
    params.permit(:id)
  end

end
