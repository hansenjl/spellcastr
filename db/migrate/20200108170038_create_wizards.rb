class CreateWizards < ActiveRecord::Migration
  def change
    create_table :wizards do |t|

      t.timestamps null: false
    end
  end
end
