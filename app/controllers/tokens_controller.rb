class TokensController < ApplicationController
  def create
    user = AuthenticatedUser.new(params[:code]).perform

    if user.persisted?
      render json: user.access_tokens.first_or_create
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end
end
