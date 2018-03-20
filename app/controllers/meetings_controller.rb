class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show]

  def index
    @meetings = Meeting.all

    respond_to do |format|
      format.html
      format.json { render json: @meetings }
    end
  end

  def new
    @meeting = Meeting.new
    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end

  def create
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @highlights = @meeting.highlights.all

    respond_to do |format|
      format.html
      format.json { render json: @meeting }
    end
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:title,
                                    :organizer_email,
                                    :start_time,
                                    :end_time)
  end
end
