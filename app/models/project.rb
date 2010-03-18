class Project < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
    description :string
    client      :string
    manager     :string
    timestamps
  end

  # --- Relations --- #
  has_many :project_assignments, :dependent => :destroy
  has_many :users, :through => :project_assignments


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
  
  validates_presence_of :name,:description,:client,:manager

end
