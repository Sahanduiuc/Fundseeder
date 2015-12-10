class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :acc_id
      t.timestamp :date
      t.references :type_name, index: true

      t.timestamps null: false
    end
    add_foreign_key :accounts, :type_names
  end
end
