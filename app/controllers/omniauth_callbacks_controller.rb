class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    generic_callback( 'instagram' )
  end

  def facebook
    generic_callback( 'facebook' )
  end

  def twitter
    generic_callback( 'twitter' )
  end

  def google_oauth2
    puts "#{__FUNCTION__}(#{__LINE__}):#{__FILE__}"
    generic_callback( 'google_oauth2' )
  end

  def generic_callback( provider )
    @identity = Identity.find_for_oauth env["omniauth.auth"]
    puts "#{__FUNCTION__}(#{__LINE__}):#{__FILE__}"
    @user = @identity.user || current_user
    if @user.nil?
      @user = User.create( email: @identity.email || "" )
      @identity.update_attribute( :user_id, @user.id )
    end

    if @user.email.blank? && @identity.email
      @user.update_attribute( :email, @identity.email)
    end

    if @user.persisted?
      @identity.update_attribute( :user_id, @user.id )
      # This is because we've created the user manually, and Device expects a
      # FormUser class (with the validations)
      @user = FormUser.find @user.id
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = env["omniauth.auth"]
      puts "env[omniauth.auth] = #{env["omniauth.auth"]}"
      redirect_to new_user_registration_url
    end
  end

  def upgrade
    scope = nil
    if params[:provider] == "google_oauth2"
      scope = "email,profile,offline,https://www.googleapis.com/auth/admin.directory.user"
    end

    redirect_to user_omniauth_authorize_path( params[:provider] ), flash: { scope: scope }
  end

  def setup
    request.env['omniauth.strategy'].options['scope'] = flash[:scope] || request.env['omniauth.strategy'].options['scope']
    render :text => "Setup complete.", :status => 404
  end

end
