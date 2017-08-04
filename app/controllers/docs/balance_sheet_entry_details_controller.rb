class Docs::BalanceSheetEntryDetailsController < Docs::DoctorsController
  helper_method :sort_column, :sort_direction
  before_action :set_entry
  before_action :set_detail, only: [:show, :edit, :update, :destroy]
  
  # def index
  #   @balance_sheet_entries = @balance_sheet.balance_sheet_entries.pagado.order("#{sort_column} #{sort_direction}")
  #                            .paginate(:page => params[:page], :per_page => 25)
  #   @balance_sheet_entries = @balance_sheet_entries.by(params[:search]) unless params[:search].blank?
  # end

  def show
  end

  def new
    @balance_sheet_entry_detail = @balance_sheet_entry.balance_sheet_entry_details.new
  end

  def edit
  end

  def create
    # params[:balance_sheet_entry][:payment_status] = entry_params[:payment_status].to_i
    # params[:balance_sheet_entry][:payment_status] = entry_params[:payment_status].to_i
    @balance_sheet_entry_detail = @balance_sheet_entry.balance_sheet_entry_details.new(entry_params)
    respond_to do |format|
      if @balance_sheet_entry_detail.save
        format.html { redirect_to docs_balance_sheet_entry_path(@balance_sheet_entry), notice: 'El detalle fue creado exitosamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @balance_sheet_entry_detail.update(entry_params)
        format.html { redirect_to docs_balance_sheet_entry_path(@balance_sheet_entry), notice: 'El detalle fue actualizado exitosamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @balance_sheet_entry_detail.destroy
    respond_to do |format|
      format.html { redirect_to docs_balance_sheet_entry_path(@balance_sheet_entry), notice: 'El detalle fue eliminado exitosamente' }
    end
  end

  private
    def set_entry
      @balance_sheet_entry = current_user.clinic.balance_sheet_entries.find(params[:balance_sheet_entry_id])
    end

    def set_detail
      set_entry
      @balance_sheet_entry_detail = @balance_sheet_entry.balance_sheet_entry_details.find(params[:id])
    end

    def entry_params
      params.require(:balance_sheet_entry_detail).permit(:title, :description, :amount, :transaction_type_id)
    end

    def sort_column
      [ "id",
        "title", 
        "incoming", 
        "outgoing" ].include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      ["asc", "desc"].include?(params[:direction]) ? params[:direction] : "asc"
    end
end

