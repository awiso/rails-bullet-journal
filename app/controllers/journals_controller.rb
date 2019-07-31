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
    p @entries

    @current_month = @journal.created_at
    @months = [@current_month]
    5.times do |i|
      i += 1
      p @months << @current_month + i.month
    end
  end

  def month
    @number_of_days = [1, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    @journal = Journal.find(params[:id])
    @month = params[:month].to_i
    @entries = @journal.entries.select { |e| e.created_at.month == @month }

  end

  private

  def journal_params
    params.require(:journal).permit(:title)
  end
end
