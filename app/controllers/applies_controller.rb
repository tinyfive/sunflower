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
      # flash[:success] = "Welcome to the Sample App!"
      redirect_to @apply
    else
      render :new
    end
  end

  private

  def load_applies
    # TODO: policy_scope
    @applies = Apply.includes(:patient, :hospital)
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
      :archive_number, :once_applied, :once_applied_remark, :insured,
      :commercial_insured, :hospital_id, :expense_amount, :affordable_amount,
      :hospital_advice_amount, :estimate_discharge_at, :reason,
      patient_attributes: [:name, :gender, :birth_certificated, :birthday, :id_type, :id_number, :remark]
    ]
  end
end
