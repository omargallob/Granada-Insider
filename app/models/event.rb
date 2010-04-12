class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :location
	has_many :egalleries
	include AASM

  aasm_column :state # defaults to aasm_state

  aasm_initial_state :open

  aasm_state :open
  aasm_state :closed

	aasm_event :close do
		transitions :to => :closed, :from => [:open,:closed]
	end

	def check_event_state?
		if self.start_at > Time.now
			self.close		
		end
	end
end
