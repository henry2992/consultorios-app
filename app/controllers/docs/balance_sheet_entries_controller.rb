class Docs::BalanceSheetEntriesController < Docs::DoctorsController
  helper_method :sort_column, :sort_direction
  before_action :set_balance_sheet
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  
  def index
    @balance_sheet_entries = @balance_sheet.balance_sheet_entries.pagado.order("#{sort_column} #{sort_direction}")
                             .paginate(:page => params[:page], :per_page => 25)
    @balance_sheet_entries = @balance_sheet_entries.by(params[:search]) unless params[:search].blank?
  end

  def show
  end

  def new
    @balance_sheet_entry = @balance_sheet.balance_sheet_entries.new
  end

  def edit
  end

  def create
    # params[:balance_sheet_entry][:payment_status] = entry_params[:payment_status].to_i
    # params[:balance_sheet_entry][:payment_status] = entry_params[:payment_status].to_i
    @balance_sheet_entry = @balance_sheet.balance_sheet_entries.new(entry_params)
    respond_to do |format|
      if @balance_sheet_entry.save
        format.html { redirect_to docs_balance_sheet_path(@balance_sheet), notice: 'El balance fue creado exitosamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @balance_sheet_entry.update(entry_params)
        format.html { redirect_to docs_balance_sheet_path(@balance_sheet), notice: 'El balance fue actualizado exitosamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @balance_sheet_entry.destroy
    respond_to do |format|
      format.html { redirect_to docs_balance_sheet_path(@balance_sheet), notice: 'El balance fue eliminado exitosamente' }
    end
  end

  private
    def set_balance_sheet
      @balance_sheet = current_user.clinic.balance_sheets.find(params[:balance_sheet_id])
    end
    # /docs/balance_sheets/:balance_sheet_id/balance_sheet_entries/new
    def set_entry
      set_balance_sheet
      @balance_sheet_entry = @balance_sheet.balance_sheet_entries.find(params[:id])
    end

    def entry_params
      params.require(:balance_sheet_entry).permit(:title, :description, :doctor_id, :patient_id, :amount, :transaction_type_id, :transaction_date, :payment_status)
    end

    def sort_column
      [ "id",
        "transaction_date", 
        "title", 
        "doctor_id", 
        "patient_id", 
        "incoming", 
        "outgoing" ].include?(params[:sort]) ? params[:sort] : "transaction_date"
    end

    def sort_direction
      ["asc", "desc"].include?(params[:direction]) ? params[:direction] : "desc"
    end
end

