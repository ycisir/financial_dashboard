class FinancialRecordsController < ApplicationController
	before_action :set_record, only: %i[update destroy]
	before_action :require_admin, only: %i[create update destroy]
	before_action :require_analyst_or_admin, only: %i[summary]

	def index
		@records = FinancialRecord.all

		# filter by record_type
    @records = FinancialRecord.where(record_type: params[:record_type]) if params[:record_type]

    # filter by category
    @records = FinancialRecord.where(category: params[:category]) if params[:category]

    # filter by date
    @records = FinancialRecord.where(date: params[:start_date]..params[:end_date]) if params[:start_date] && params[:end_date]

		render json: @records
	end

	def summary
    total_income = FinancialRecord.where(record_type: "income").sum(:amount)
    total_expense = FinancialRecord.where(record_type: "expense").sum(:amount)
    net_balance = total_income - total_expense
    category_totals = FinancialRecord.group(:category).sum(:amount)

    render json: {
      total_income: total_income,
      total_expense: total_expense,
      net_balance: net_balance,
      category_totals: category_totals
    }
  end

  def create
    @record = FinancialRecord.new(record_params)
    if @record.save
      render json: { message: "Record created successfully" }, status: :created
    else
      render json: { errors: @record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @record.update(record_params)
      render json: { message: "Record updated successfully", record: @record }
    else
      render json: { errors: @record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @record.destroy
    render json: { message: "Record deleted successfully" }
  end

  private

  def set_record
    @record = FinancialRecord.find(params[:id])
  end

  def record_params
    params.require(:financial_record).permit(:amount, :record_type, :category, :date, :notes, :user_id)
  end
end
