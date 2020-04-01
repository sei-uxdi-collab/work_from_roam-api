class WorkSpacesController < OpenReadController
  before_action :set_work_space, only: [:show, :update, :destroy]

  # GET /work_spaces
  def index
    @work_spaces = WorkSpace.all

    render json: @work_spaces
  end

  # GET /work_spaces/1
  def show
    render json: @work_space
  end

  # POST /work_spaces
  def create
    @work_space = current_user.work_spaces.build(work_space_params)

    if @work_space.save
      render json: @work_space, status: :created, location: @work_space
    else
      render json: @work_space.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /work_spaces/1
  def update
    if @work_space.update(work_space_params)
      render json: @work_space
    else
      render json: @work_space.errors, status: :unprocessable_entity
    end
  end

  # DELETE /work_spaces/1
  def destroy
    @work_space.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_space
      @work_space = WorkSpace.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def work_space_params
      params.require(:work_space).permit(:place_id, :lat, :lng, :user_id, :avg_rating)
    end
end
