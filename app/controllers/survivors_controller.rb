class SurvivorsController < ApplicationController
  before_action :set_survivor, only: %i[ show edit update destroy ]
  helper_method :sort_column, :sort_direction

  # GET /survivors or /survivors.json
  def index
    @survivors = Survivor.order(sort_column + " " + sort_direction)
      respond_to do |format|
        format.html { @survivors = @survivors.page(params[:page]) }
        format.csv { send_data @survivors.to_csv, filename: "survivors-#{DateTime.now.strftime("%d_%m_%Y%")}.csv"}
      end
  end

  # GET /survivors/1 or /survivors/1.json
  def show
  end

  # GET /survivors/new
  def new
    @survivor = Survivor.new
  end

  # GET /survivors/1/edit
  def edit
  end

  # POST /survivors or /survivors.json
  def create
    @survivor = Survivor.new(survivor_params)

    respond_to do |format|
      if @survivor.save
        format.html { redirect_to survivor_url(@survivor), notice: "Survivor was successfully created." }
        format.json { render :show, status: :created, location: @survivor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @survivor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survivors/1 or /survivors/1.json
  def update
    respond_to do |format|
      if @survivor.update(survivor_params)
        format.html { redirect_to survivor_url(@survivor), notice: "Survivor was successfully updated." }
        format.json { render :show, status: :ok, location: @survivor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @survivor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survivors/1 or /survivors/1.json
  def destroy
    @survivor.destroy

    respond_to do |format|
      format.html { redirect_to survivors_url, notice: "Survivor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survivor
      @survivor = Survivor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survivor_params
      params.require(:survivor).permit(:name, :age, :gender, :latitude, :longitude, :abducted)
    end

    #sort the columun by column #id
    def sort_column 
      Survivor.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    #sort the columun by asc or desc
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
