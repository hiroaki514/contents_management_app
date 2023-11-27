# frozen_string_literal: true

class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show edit update destroy]

  def index
    @organizations = Organization.page(params[:page]).per(10)
  end

  def show; end

  def new
    @organization = Organization.new
  end

  def edit; end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      @organization.update(created_user_id: current_user.id)
      flash[:success] = '組織を登録しました'
      redirect_to organizations_path
    else
      flash.now[:alert] = '組織の登録に失敗しました'
      render :new
    end
  end

  def update
    if @organization.update(organization_params.merge(updated_user_id: current_user.id))
      flash[:success] = '組織名を更新しました'
      redirect_to organizations_path
    else
      render :edit
    end
  end

  def destroy
    if @organization.update(discarded_at: Time.zone.now)
      flash[:success] = '組織を削除しました'
    else
      flash[:alert] = '組織の削除に失敗しました'
    end
    redirect_to organizations_path
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name)
  end
end
