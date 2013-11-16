class VitaeController < ApplicationController
  
  def show
    @vitaes = Vitae.includes(:user, :jobs, :schools, :refs).where(code: params[:code]).to_a
  end
end