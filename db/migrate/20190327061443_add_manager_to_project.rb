class AddManagerToProject < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :manager
  end
end
