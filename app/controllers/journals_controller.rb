class JournalsController < ApplicationController
  before_action :find_journal, only: [:show, :edit, :update, :destroy, :future, :month]

  def index
    @journals = Journal.all
  end

  def show
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
  end

  def update
    @journal.update(journal_params)
    redirect_to journal_path(@journal)
  end

  def destroy
    @journal.destroy
    redirect_to journals_path
  end

  def future
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
    @month = params[:month].to_i
    @entries = @journal.entries.select { |e| e.created_at.month == @month }
  end

  private

  def find_journal
    @journal = Journal.find(params[:id])
  end

  def journal_params
    params.require(:journal).permit(:title)
  end
end
