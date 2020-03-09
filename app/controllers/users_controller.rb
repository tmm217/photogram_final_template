class UsersController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:new_registration_form, :create, :index] })

  before_action(:load_user, { :only => [:show, :liked_photos, :feed, :discover] })
  
  before_action(:must_be_allowed, { :only => [:show, :liked_photos, :feed, :discover] })
  
  def load_user
    the_username = params.fetch("path_username")
    @user = User.where({ :username => the_username }).at(0)
  end

  def must_be_allowed
    if (@user != @current_user) && (@user.private && @user.followers.exclude?(@current_user))
      redirect_to("/", { :notice => "You're not authorized for that." })
    end
  end

  def new_registration_form
    render({ :template => "user_sessions/sign_up.html.erb" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.private = params.fetch("query_private", false)
    @user.username = params.fetch("query_username")

    save_status = @user.save

    if save_status == true
      session.store(:user_id,  @user.id)
   
      redirect_to("/", { :notice => "User account created successfully."})
    else
      redirect_to("/user_sign_up", { :alert => "User account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "users/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.private = params.fetch("query_private", false)
    @user.username = params.fetch("query_username")
    
    if @user.valid?
      @user.save

      redirect_to("/", { :notice => "User account updated successfully."})
    else
      render({ :template => "users/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end

  def index
    @users = User.all.order({ :username => :asc })
    render({ :template => "users/index.html" })
  end

  def show
    render({ :template => "users/show.html.erb" })
  end

  def liked_photos
    render({ :template => "users/liked_photos.html.erb" })
  end

  def feed
    render({ :template => "users/feed.html.erb" })
  end

  def discover
    render({ :template => "users/discover.html.erb" })
  end
end
