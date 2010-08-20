class Freelancer::Rails::AuthorizationsController < ApplicationController

  include Freelancer::Rails::Controllers::Helpers

  def new
  end

  def create
    
    freelancer_client.set_callback_url(freelancer_oauth_callback_url + "?")
    session["freelancer_oauth_request_token"] = freelancer_client.request_token.token
    session["freelancer_oauth_request_secret"] = freelancer_client.request_token.secret

    authorize_url = freelancer_client.request_token.authorize_url
    redirect_to authorize_url

  end

  def oauth_callback

    request_token = session["freelancer_oauth_request_token"]
    request_secret = session["freelancer_oauth_request_secret"]

    freelancer_client.authorize_from_request(request_token, request_secret, params[:oauth_verifier])
    session["freelancer_oauth_access_token"] = freelancer_client.access_token.token
    session["freelancer_oauth_access_secret"] = freelancer_client.access_token.secret

    redirect_to root_path
    
  end

end
