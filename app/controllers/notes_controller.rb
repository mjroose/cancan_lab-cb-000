class NotesController < ApplicationController
  load_and_authorize_resource

  def index
    @user = current_user
  end

  def show
    @note = Note.find_by(id: params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @user = current_user
    @user.notes.create_from_params(note_params)
    redirect_to root_path
  end

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def update
    @note = Note.find_by(id: params[:id])
    @note.update_from_params(note_params)
    redirect_to root_path
  end

  def destroy
  end

  private
    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
