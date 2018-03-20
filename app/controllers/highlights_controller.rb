class HighlightsController < ApplicationController
  before_action :set_meeting

  def new
    @highlight = @meeting.highlights.new

    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end

  def create
    @highlight = @meeting.highlights.new(highlight_params)

    respond_to do |format|
      if @highlight.save
        format.html { redirect_to @meeting, notice: 'Highlight was successfully created.' }
        format.json { render :show, status: :created, location: @highlight }
      else
        format.html { render :new }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @highlight = Highlight.find(params[:id])

    respond_to do |format|
      format.json { render json: @highlight }
    end
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def highlight_params
    params.require(:highlight).permit(:start_time,
                                      :end_time,
                                      :highlight_text)
  end
end
