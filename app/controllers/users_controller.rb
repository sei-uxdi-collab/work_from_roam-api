# frozen_string_literal: true

class UsersController < ProtectedController
  skip_before_action :authenticate, only: %i[signup signin checkusername checkemail]

  # POST '/sign-up'
  def signup
    user = User.create(user_creds)
    if user.valid?
      render json: user, status: :created
    else
      render json: user.errors, status: :bad_request
    end
  end

  # GET '/checkname'
  # Check if username is taken
  # Returns true or false
  def checkusername
    @user = User.where(username: params[:username]).exists?

    render json: @user
  end

  # GET '/checkemail'
  # Check if email is taken
  # Returns true or false
  def checkemail
    @user = User.where(email: params[:email]).exists?

    render json: @user
  end

  # POST '/sign-in'
  def signin
    creds = user_creds
    if (user = User.authenticate creds[:identifier],
                                 creds[:password])
      render json: user, serializer: UserLoginSerializer, root: 'user'
    else
      head :unauthorized
    end
  end

  # DELETE '/sign-out'
  def signout
    current_user.logout
    head :no_content
  end

  # PATCH '/change-password/:id'
  def changepw
    # if the the old password authenticates,
    # the new one is not blank,
    # and the model saves
    # then 204
    # else 400
    if current_user.authenticate(pw_creds[:old]) &&
       !(current_user.password = pw_creds[:new]).blank? &&
       current_user.save
      head :no_content
    else
      head :bad_request
    end
  end

  # PATCH '/update-user/:id'
  def update
    if current_user &&
       !(current_user.username = username_creds[:username]).blank? &&
       !(current_user.email = username_creds[:email]).blank? &&
       !(current_user.avatar = username_creds[:avatar]).blank? &&
       current_user.save
      head :no_content
    else
      head :bad_request
    end
  end

  # GET '/show-user'
  def showuser
    if current_user
      render json: current_user, serializer: UserLoginSerializer, root: 'user'
    else
      head :unauthorized
    end
  end

  private

  def user_creds
    params.require(:credentials)
          .permit(:email, :username, :avatar, :identifier, :password, :password_confirmation)
  end

  def pw_creds
    params.require(:passwords)
          .permit(:old, :new)
  end

  def username_creds
    params.require(:credentials)
          .permit(:password, :username, :email, :avatar)
  end
end
