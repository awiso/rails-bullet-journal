class JournalsController < ApplicationController
  def index
    @journals = Journal.all
  end

  def show
    @journal = Journal.find(params[:id])
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)
    @journal.save!
    redirect_to journal_path(@journal)
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def update
    @journal = Journal.find(params[:id])
    @journal.update(journal_params)
    redirect_to journal_path(@journal)
  end

  def destroy
    @journal = Journal.find(params[:id])
    @journal.destroy
    redirect_to journals_path
  end

  def future
    @journal = Journal.find(params[:id])
    @entries = @journal.entries.select{ |e| e.scope == 'future' }
  end

  private

  def journal_params
    params.require(:journal).permit(:title)
  end
end
