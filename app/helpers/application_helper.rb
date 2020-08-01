module ApplicationHelper
  def count_open_tickets(tickets)
    tickets.select { |t| t.status != 'fixed' }.size
  end

  def format_status(status)
    status.gsub('_', ' ').titleize
  end
end