class Api::V1::SwitchesController < Api::V1::ApiController
  before_action :set_switch, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_api_v1_user!

  # GET /api/v1/switches
  # GET /api/v1/switches.json
  def index
    @switches = Switch.all
  end

  # GET /api/v1/switches/1
  # GET /api/v1/switches/1.json
  def show
  end

  # GET /api/v1/switches/new
  def new
    @switch = Switch.new
  end

  # GET /api/v1/switches/1/edit
  def edit
  end

  # POST /api/v1/switches
  # POST /api/v1/switches.json
  def create
    @switch = Switch.new(switch_params)

    respond_to do |format|
      if @switch.save
        format.html { redirect_to @switch, notice: 'Switch was successfully created.' }
        format.json { render :show, status: :created, location: @switch }
      else
        format.html { render :new }
        format.json { render json: @switch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/switches/1
  # PATCH/PUT /api/v1/switches/1.json
  def update
    respond_to do |format|
      if @switch.update(switch_params)
        format.html { redirect_to @switch, notice: 'Switch was successfully updated.' }
        format.json { render :show, status: :ok, location: @switch }
      else
        format.html { render :edit }
        format.json { render json: @switch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/switches/1
  # DELETE /api/v1/switches/1.json
  def destroy
    @switch.destroy
    respond_to do |format|
      format.html { redirect_to switches_url, notice: 'Switch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_switch
      @switch = Switch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def switch_params
      params.require(:switch).permit(:name, :state, :intensity, :room_id)
    end
end
