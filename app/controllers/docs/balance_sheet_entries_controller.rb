class Docs::BalanceSheetEntriesController < Docs::DoctorsController
  helper_method :sort_column, :sort_direction
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  
  def index
    @balances = current_user.clinic.balance_sheet_entries.pagado.order("#{sort_column} #{sort_direction}").paginate(:page => params[:page], :per_page => 25)
    @balances = @balances.by(params[:search]) unless params[:search].blank?
  end

  def show
    @balance_sheet_entry_details = @balance_sheet_entry.balance_sheet_entry_details.order("#{sort_column_entry} #{sort_direction_entry}")
                             .paginate(:page => params[:page], :per_page => 25)
    @balance_sheet_entry_details = @balance_sheet_entry_details.by(params[:search]) unless params[:search].blank?
  end

  def new
    @balance_sheet_entry = current_user.clinic.balance_sheet_entries.new
  end

  def edit
  end

  def create
    @balance_sheet_entry = current_user.clinic.balance_sheet_entries.new(entry_params)
    respond_to do |format|
      if @balance_sheet_entry.save
        format.html { redirect_to docs_balance_sheet_entry_path(@balance_sheet_entry), notice: 'La entrada fue creada exitosamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @balance_sheet_entry.update(entry_params)
        format.html { redirect_to docs_balance_sheet_entry_path(@balance_sheet_entry), notice: 'La entrada fue actualizada exitosamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @balance_sheet_entry.destroy
    respond_to do |format|
      format.html { redirect_to docs_balance_sheet_entries_url, notice: 'La entrada fue eliminada exitosamente' }
    end
  end

  private

    def set_entry
      @balance_sheet_entry = current_user.clinic.balance_sheet_entries.find(params[:id])
    end

    def entry_params
      params.require(:balance_sheet_entry).permit(:title, :description, :doctor_id, :patient_id, :transaction_date, :payment_status)
    end

    def sort_column
      ["transaction_date", "title", "doctor_id", "patient_id", "amount"].include?(params[:sort]) ? params[:sort] : "transaction_date"
    end

    def sort_column_entry
      [ "id",
        "title", 
        "incoming", 
        "outgoing" ].include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction_entry
      ["asc", "desc"].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def sort_direction
      ["asc", "desc"].include?(params[:direction]) ? params[:direction] : "desc"
    end
end

