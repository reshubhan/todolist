class Task < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    project_assignment_id   :integer
    name               :string
    description        :text
    to_be_completed_on :date
    priority           :integer
    timestamps
  end

  # --- Relations --- #
  belongs_to :project_assignment

  # --- Permissions --- #

  def create_permitted?
    #acting_user.administrator?
    if !acting_user.guest? && acting_user.signed_up?
      true
    else
      false
    end
  end

  def update_permitted?
    if acting_user.administrator?
      true
    elsif !acting_user.guest? && acting_user.signed_up? && !acting_user.administrator? && !projects_user_changed?
      true
    else
      false
    end
  end

  def destroy_permitted?
    #acting_user.administrator?
    if !acting_user.guest? && acting_user.signed_up?
      true
    else
      false
    end
  end

  def view_permitted?(field)
    true
  end
  
  validates_presence_of :name, :description, :priority, :to_be_completed_on
  validates_numericality_of :priority
  
end
