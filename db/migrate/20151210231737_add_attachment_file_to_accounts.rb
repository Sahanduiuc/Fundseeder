class AddAttachmentFileToAccounts < ActiveRecord::Migration
  def self.up
    change_table :accounts do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :accounts, :file
  end
end
