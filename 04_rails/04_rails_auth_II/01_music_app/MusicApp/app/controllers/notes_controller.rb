class NotesController < ApplicationController
  def new
    @note = Note.new
    render :note
  end

  def create
    note = Note.new(note_params)
    user_id = current_user.id
    note.user_id = user_id

    if note.save
      redirect_to track_url(params[:note][:track_id])
    else
      flash[:errors] = ["Invalid note"]
      # render 'tracks'
      redirect_to track_url(params[:note][:track_id])
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    note = Note.find_by(id: params[:id])
    track_id = note.track_id

    if current_user.id == note.user_id
      note.destroy
    else
      render text: '403 FORBIDDEN'
    end
    
    redirect_to track_url(track_id)
  end

  private

  def note_params
    params.require(:note).permit(:user_id, :track_id, :note_text)
  end
end