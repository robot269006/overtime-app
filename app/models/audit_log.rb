class AuditLog < ApplicationRecord
  enum status: { pending: 0, confirmed: 1 }

  belongs_to :user
  validates_presence_of :user_id, :status, :start_date

  #callback method
  after_initialize :set_defaults
  before_update :set_end_date, if: :confirmed?

  private
  def set_end_date
    self.end_date = Date.today
  end
  def set_defaults
    # ||= -> this looks at the rest of the system,
    # if the start date is passed in, it's going to use that passed-in value
    # but if it doesn't have any values passed in, it uses the default value set in here
    self.start_date ||= Date.today - 6.days
  end
end
