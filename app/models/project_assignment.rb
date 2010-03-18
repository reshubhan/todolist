class ProjectAssignment < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    project_id       :integer
    user_id          :integer
    name             :string
    role             :string
    responsibilities :text
    timestamps
  end

  # --- Relations --- #
  belongs_to :user
  belongs_to :project
  has_many :tasks
  
  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end
  
  validates_presence_of :project_id,:user_id

end
