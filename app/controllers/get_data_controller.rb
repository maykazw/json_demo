class GetDataController < ApplicationController
  def index
     get_users = GetData::GetDataFromUrlService.call({url: "https://jsonplaceholder.typicode.com/users"})
     get_posts = GetData::GetDataFromUrlService.call({url: "https://jsonplaceholder.typicode.com/posts"})
     get_comments = GetData::GetDataFromUrlService.call({url: "https://jsonplaceholder.typicode.com/comments"})
     if [get_users[:status], get_posts[:status], get_comments[:status]].exclude? "400"
       import_users = GetData::CreateUsersService.call({:users_data=>get_users[:response]})
       imports_posts = GetData::CreatePostsService.call({:posts_data=>get_posts[:response]})
       imports_comments = GetData::CreateCommentsService.call({:comments_data=>get_comments[:response]})
     end
  end
end