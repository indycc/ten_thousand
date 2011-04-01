class ReportsController < ApplicationController
  require_user

  def calendar
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)

    @event_strips = PracticeLog.event_strips_for_month(@shown_month, :include => :expertise)

    @next_month = @shown_month.next_month
    @total_month_hours = PracticeLog.where(:occurred_on => (@shown_month..@next_month)).sum(:duration)
  end

end
