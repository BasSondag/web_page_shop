class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.boolean :administrator	
      t.references :user, index: true

      t.timestamps
    end
  end
end
