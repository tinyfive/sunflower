class ApprovalsController < ApplicationController
  def create
    load_apply
    build_approval

    if @approval.save
      flash[:success] = '审核成功！'
      redirect_to apply_path(@apply)
    else
      render :new
    end
  end

  # def edit
  #   load_apply
  # end
  #
  # def update
  #   load_apply
  #   build_apply
  #   if @apply.save
  #     flash[:success] = '修改成功！'
  #     redirect_to apply_path(@apply)
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   load_apply
  #   if @apply.destroy
  #     flash[:success] = '删除成功！'
  #     redirect_to applies_path
  #   else
  #     redirect_to apply_path(@apply)
  #   end
  # end

  private

  def load_apply
    @apply = Apply.find params[:apply_id]
    authorize @apply, :approve?
  end

  def build_approval
    @approval ||= @apply.approvals.build(creator: current_user, category: current_user.organization.category)
    @approval.attributes = permit_params
  end

  def permit_params
    params.fetch(:approval, {}).permit [
      :remark, :creator_id, :aid_amount, :status
    ]
  end
end
