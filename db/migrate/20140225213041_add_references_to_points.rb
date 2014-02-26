class AddReferencesToPoints < ActiveRecord::Migration
  def change
    #remove_column :points, :postable_id, :integer
   # change_table :points do |t|
    #  t.references :pointable, :polymorphic => true
   # end
  end
end
