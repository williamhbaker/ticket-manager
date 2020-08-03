module ApplicationHelper
  def count_open_tickets(tickets)
    tickets.select { |t| t.status != 'fixed' }.size
  end

  def format_status(status)
    status.gsub('_', ' ').titleize
  end

  def display_datetime(dt)
    dt.strftime("%m/%d/%Y %l:%M%P")
  end
end