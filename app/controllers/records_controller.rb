class RecordsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :category
  load_and_authorize_resource :record, through: :category, except: %i[create new]
  # before_action :set_record, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token

  # GET /records or /records.json
  def index; end

  # GET /records/1 or /records/1.json
  def show; end

  # GET /records/new
  def new
    @record = Record.new
    @category = Category.find(params[:category_id])
  end

  # GET /records/1/edit
  def edit; end

  # POST /records or /records.json
  def create
    authorize! :manage, @category
    @record = current_user.records.new(record_params)
    cat_ids = create_params[:categories][:ids].slice(1..-1) || []
    categories = current_user.categories.find(cat_ids)
    @record.categories = categories

    respond_to do |format|
      if @record.save
        format.html { redirect_to category_records_path(@category), notice: 'Record was successfully created.' }
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

  def record_params
    params.require(:record).permit(:name, :ammount)
  end

  def create_params
    params.require(:record).permit(:name, :ammount, categories: [ids: []])
  end
end
