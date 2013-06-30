class HomeController < ApplicationController
  
  before_filter :authenticate_user!, :only => :my_profile
  
  def index
    # @photos = Photo.last(25)
    @photos = Photo.joins(:album => :user).select("photos.*, albums.id as album_id, albums.name as album_name, users.first_name as users_first_name, users.last_name as users_last_name").last(25)
  end
  
  def my_profile
    @albums = current_user.albums if user_signed_in?
  end
  
  def routing_error
    redirect_to root_url, :flash => { :alert => "The page you were looking for could not be found." }
  end
  
end
