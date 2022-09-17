class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show edit update destroy ]
  helper_method :sort_column, :sort_direction

  # GET /reports or /reports.json
  def index
      @reports = Report.order(sort_column + " " + sort_direction)
      respond_to do |format|
        format.html { @reports = @reports.page(params[:page]) }
        format.json { @reports = @reports.page(params[:page]) }
        format.csv { send_data @reports.to_csv, filename: "reports-#{DateTime.now.strftime("%d_%m_%Y%")}.csv"}
     end
  end

  # GET /reports/1 or /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports or /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to report_url(@report), notice: "Report was successfully created." }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to report_url(@report), notice: "Report was successfully updated." }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url, notice: "Report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(:reporter_id, :reported_id)
    end

     #sort the columun by column #id
     def sort_column 
      Report.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    #sort the columun by asc or desc
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
