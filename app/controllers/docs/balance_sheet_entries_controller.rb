class Docs::BalanceSheetEntriesController < Docs::DoctorsController
  helper_method :sort_column, :sort_direction
  before_action :set_details, only: [:edit, :update]
  before_action :set_detail, only: [:edit, :update]
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  
  def index
    @balances = current_user.clinic.balance_sheet_entries.pagado.order("#{sort_column} #{sort_direction}").paginate(:page => params[:page], :per_page => 25)
    @balances = @balances.by_range(params[:from],params[:to]) unless ( params[:from].blank? || params[:to].blank? )
    @balances = @balances.by_month(Date.today.month) if ( params[:from].blank? || params[:to].blank? )
  end

  def show
    @balance_sheet_entry_details = @balance_sheet_entry.balance_sheet_entry_details.order("#{sort_column_entry} #{sort_direction_entry}")
                             .paginate(:page => params[:page], :per_page => 25)
    @balance_sheet_entry_details = @balance_sheet_entry_details.by(params[:search]) unless params[:search].blank?
  end

  def new
    @balance_sheet_entry = current_user.clinic.balance_sheet_entries.new
    @balance_sheet_entry.balance_sheet_entry_details.build
  end

  def edit
  end

  def create
    @balance_sheet_entry = current_user.clinic.balance_sheet_entries.build(entry_params)
    # @balance_sheet_entry.balance_sheet_entry_details.build(entry_params[:balance_sheet_entry_details_attributes])
    # raise entry_params.to_yaml
    respond_to do |format|
      if @balance_sheet_entry.save
        format.html { redirect_to edit_docs_balance_sheet_entry_path(@balance_sheet_entry), notice: 'La entrada fue creada exitosamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @balance_sheet_entry.update(entry_params)
        format.html { redirect_to edit_docs_balance_sheet_entry_path(@balance_sheet_entry), notice: 'La entrada fue actualizada exitosamente.' }
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

    def set_detail
      set_entry
      @detail = @balance_sheet_entry.balance_sheet_entry_details.build
    end

    def set_details
      set_entry
      @details = @balance_sheet_entry.balance_sheet_entry_details
    end

    def entry_params
      params.require(:balance_sheet_entry).permit(:title, :description, :doctor_id, :patient_id, :transaction_date, :payment_status, balance_sheet_entry_details_attributes: [:title, :description, :amount, :transaction_type_id])
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

