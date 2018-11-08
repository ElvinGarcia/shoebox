module PostsHelper
    
    def current_pic
        @pic = current_user.pics.find(params[:pic_id])    
    end

end