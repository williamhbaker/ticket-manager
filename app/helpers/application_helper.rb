module ApplicationHelper
  def count_open_tickets(tickets)
    tickets.select { |t| t.status != 'fixed' }.size
  end
end