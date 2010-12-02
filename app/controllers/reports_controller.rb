class ReportsController < ApplicationController
  def calendar
    @start = Date.new params[:year].to_i, params[:month].to_i, 1
    @end   = @start.at_end_of_month
    @practices = PracticeLog.between @start, @end
  rescue ArgumentError => e
    logger.warn e
    redirect_to calendar_report_path(:year => Date.today.year, :month => Date.today.month)
  end

end
