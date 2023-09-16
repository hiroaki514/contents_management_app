class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[edit update]

  def index
    @organizations = Organization.page(params[:page]).per(10)
  end

  def show; end

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

  def edit; end

  def update
    if @organization.update(organization_params)
      redirect_to organizations_path
      flash[:success] = '組織名を更新しました'
    else
      render :edit
    end
  end


  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name)
  end


end
