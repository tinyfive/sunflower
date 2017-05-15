class AppliesController < ApplicationController
  def index
  end

  def new
    build_apply
  end

  def create
    build_apply
    if @apply.save
      render :show
    else
      render :new
    end
  end

  private

  def build_apply
    @apply ||= Apply.new
    @apply.build_patient unless @apply.patient.present?
  end
end
