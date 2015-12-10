class CreateTypeNames < ActiveRecord::Migration
  def change
    create_table :type_names do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
