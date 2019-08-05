class EntriesController < ApplicationController
  before_action :find_entry, only: [:show, :edit, :update, :destroy]

  def index
    @journal = Journal.find(params[:journal_id])
  end

  def show
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
  end

  def update
    @entry.update(entry_params)
    redirect_to journal_entry_path(@entry)
  end

  def destroy
    @entry.destroy
    redirect_to journal_entries_path
  end

  private
  def find_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :content, :scope, :entry_type)
  end


end
