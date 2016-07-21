class Api::V1::RoomsController < Api::V1::ApiController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_api_v1_user!
  # GET /api/v1/rooms
  # GET /api/v1/rooms.json
  def index
    @rooms = current_api_v1_user.rooms
  end

  # GET /api/v1/rooms/1
  # GET /api/v1/rooms/1.json
  def show
  end

  # GET /api/v1/rooms/new
  def new
    @room = Room.new
  end

  # GET /api/v1/rooms/1/edit
  def edit
  end

  # POST /api/v1/rooms
  # POST /api/v1/rooms.json
  def create
    @room = Room.new(room_params)
    @room.user = current_api_v1_user

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/rooms/1
  # PATCH/PUT /api/v1/rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/rooms/1
  # DELETE /api/v1/rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = current_api_v1_user.rooms.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :user_id)
    end
end
