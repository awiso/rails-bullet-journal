class EntriesController < ApplicationController
  def index
    @journal = Journal.find(params[:journal_id])
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    # @types = ['day', 'month', 'future']
    @journal = Journal.find(params[:journal_id])
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.journal = Journal.find(params[:journal_id])
    @entry.done = false
    @entry.save!

    redirect_to journal_entry_path(@entry.journal, @entry)
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update(entry_params)
    redirect_to journal_entry_path(@entry)
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to journal_entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :content, :scope, :entry_type)
  end


end
