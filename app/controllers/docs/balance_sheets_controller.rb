class Docs::BalanceSheetsController < Docs::DoctorsController
  helper_method :sort_column, :sort_direction
  before_action :set_balance_sheet, only: [:show, :edit, :update, :destroy]
  
  def index
    @balances = current_user.clinic.balance_sheets.order("#{sort_column} #{sort_direction}").paginate(:page => params[:page], :per_page => 25)
    @balances = @balances.by(params[:search]) unless params[:search].blank?
  end

  def show
    @balance_sheet_entries = @balance_sheet.balance_sheet_entries.pagado.order("#{sort_column_entry} #{sort_direction}")
                             .paginate(:page => params[:page], :per_page => 25)
    @balance_sheet_entries = @balance_sheet_entries.by(params[:search]) unless params[:search].blank?
  end

  def new
    @balance_sheet = current_user.clinic.balance_sheets.new
  end

  def edit
  end

  def create
    @balance_sheet = current_user.clinic.balance_sheets.new(balance_sheet_params)
    respond_to do |format|
      if @balance_sheet.save
        format.html { redirect_to docs_balance_sheet_path(@balance_sheet), notice: 'El balance fue creado exitosamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @balance_sheet.update(balance_sheet_params)
        format.html { redirect_to docs_balance_sheets_url, notice: 'El balance fue actualizado exitosamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @balance_sheet.destroy
    respond_to do |format|
      format.html { redirect_to docs_balance_sheets_url, notice: 'El balance fue eliminado exitosamente' }
    end
  end

  private

    def set_balance_sheet
      @balance_sheet = current_user.clinic.balance_sheets.find(params[:id])
    end

    def balance_sheet_params
      params.require(:balance_sheet).permit(:title, :description, :start_at, :ends_at)
    end

    def sort_column
      ["title", "start_at", "ends_at"].include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column_entry
      [ "id",
        "transaction_date", 
        "title", 
        "doctor_id", 
        "patient_id", 
        "incoming", 
        "outgoing" ].include?(params[:sort]) ? params[:sort] : "transaction_date"
    end

    def sort_direction
      ["asc", "desc"].include?(params[:direction]) ? params[:direction] : "asc"
    end
end

