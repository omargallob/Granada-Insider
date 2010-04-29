class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :location
	has_many :egalleries
  
	belongs_to :event_type
  validates_length_of       :description,    :within => 140..170

	include AASM
	cattr_reader :per_page
	@@per_page = 2
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
		else
			self.open	
		end
	end
end
