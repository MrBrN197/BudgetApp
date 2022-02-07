class RecordsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :category
  load_and_authorize_resource :record, through: :category
  # before_action :set_record, only: %i[show edit update destroy]

  # GET /records or /records.json
  def index
  end

  # GET /records/1 or /records/1.json
  def show
  end

  # GET /records/new
  def new
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records or /records.json
  def create
    @record = Record.new(**record_params, user: current_user)

    respond_to do |format|
      if @record.save
        CategoriesRecord.create!(category: @category, record: @record)
        format.html { redirect_to [@category, @record], notice: "Record was successfully created." }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1 or /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to [@category, @record], notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1 or /records/1.json
  def destroy
    @record.destroy

    respond_to do |format|
      format.html { redirect_to category_records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_record
  #   @record = Record.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def record_params
    params.require(:record).permit(:name, :ammount)
  end
end
