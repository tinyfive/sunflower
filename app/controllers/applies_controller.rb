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
    @applies = Apply.includes(:patient)
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
