module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), admin_calendar_path(month_date.year, month_date.month))
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.last_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>"    }

  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event = args[:event]
			if logged_in? and current_user.has_role?("Admin")	
	      %(<a href="/admin/events/#{event.id}" title="#{h(event.name)}">#{h(event.name)}</a>)
			else
			%(<a href="/events/#{event.id}" title="#{h(event.name)}">#{h(event.name)}</a>)
			end
    end
  end
end
