class RemoveWorkerIdFromBugs < ActiveRecord::Migration[5.2]
  def change
    remove_column :bugs, :worker_id, :Integer
  end
end
