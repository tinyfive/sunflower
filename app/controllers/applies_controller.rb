# == Schema Information
#
# Table name: applies
#
#  id                     :integer          not null, primary key
#  patient_id             :integer
#  creator_id             :integer
#  archive_number         :integer
#  status                 :integer
#  insured                :boolean
#  commercial_insured     :boolean
#  hospital_id            :integer
#  expense_amount         :decimal(10, )
#  affordable_amount      :decimal(10, )
#  hospital_advice_amount :decimal(10, )
#  estimate_discharge_at  :date
#  reason                 :text(65535)
#  once_applied           :boolean
#  once_applied_remark    :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class AppliesController < ApplicationController
  def index
    load_applies
  end

  def show
    load_apply
  end

  def new
    build_apply
  end

  def create
    build_apply
    if @apply.save
      flash[:success] = '添加成功！'
      redirect_to apply_path(@apply)
    else
      render :new
    end
  end

  def edit
    load_apply
  end

  def update
    load_apply
    build_apply
    if @apply.save
      flash[:success] = '修改成功！'
      redirect_to apply_path(@apply)
    else
      render :edit
    end
  end

  def destroy
    load_apply
    if @apply.destroy
      flash[:success] = '删除成功！'
      redirect_to applies_path
    else
      redirect_to apply_path(@apply)
    end
  end

  private

  def load_applies
    @q = Apply.ransack(params[:q])
    @applies = policy_scope(@q.result).includes(:patient, :hospital).page(params[:page])
  end

  def load_apply
    @apply = Apply.find params[:id]
  end

  def build_apply
    @apply ||= Apply.new
    @apply.build_patient(gender: 0, id_type: 0) unless @apply.patient.present?
    @apply.attributes = permit_params
  end

  def permit_params
    params.fetch(:apply, {}).permit [
      :status, :disease_id, :archive_number, :once_applied, :once_applied_remark, :insured,
      :commercial_insured, :hospital_id, :expense_amount, :affordable_amount,
      :hospital_advice_amount, :estimate_discharge_at, :reason,
      patient_attributes: [
        :id, :_destroy, :name, :gender, :birth_certificated, :birthday, :id_type, :id_number, :remark,
        social_relations_attributes: [:id, :_destroy, :relationship, :name, :tel, :employer, :employer_tel, :income_amount]
      ],
    ]
  end
end
