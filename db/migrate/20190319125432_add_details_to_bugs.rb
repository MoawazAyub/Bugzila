class AddDetailsToBugs < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :founder
    add_reference :bugs, :worker
  end
end
