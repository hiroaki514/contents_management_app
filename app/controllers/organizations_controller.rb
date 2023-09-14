class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.page(params[:page]).per(10)
  end

  def show 

  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.valid?
      @organization.save
      redirect_to root_path
      flash[:success] = 'ユーザを登録しました'
    else
      render :new
      flash.now[:alert] = 'ユーザ登録に失敗しました'
    end
  end


  private

  def organization_params
    params.require(:organization).permit(:name)
  end

end
