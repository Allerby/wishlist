class HotwireController < ApplicationController

  def index
    @presents = Present.all
  end

  def create
    @present = Present.new(present_params)

    respond_to do |format|
      if @present.save
        format.json { render json: @present, status: :created }
      else
        format.json { render json: @present, status: :unprocessable_entity }
      end
    end
  end

  private

    def present_params
      params.permit(:name, :image_path)
    end

end
