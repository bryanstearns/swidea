class UsersController < ApplicationController
  before_filter :login_required, :only => [ :edit ]
  
  # Be sure to include AuthenticationSystem in Application Controller instead
  # include AuthenticatedSystem

  # render new.rhtml
  def new
    @user = User.new
  end
  
  def edit
    @user = @current_user
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    @user.skill_ids = params[:user][:skill_ids]
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
            redirect_back_or_default(root_path)
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def show
    @user = User.find(params[:id], :include => :skills)
  end
end
