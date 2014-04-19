class CreateLedgerItems < ActiveRecord::Migration
  def change
    create_table :ledger_items do |t|
      t.string :type
      t.integer :sender_id
      t.integer :recipient_id
      t.datetime :issue_date
      t.decimal :total_amount, :precision => 20, :scale => 4
      t.decimal :tax_amount, :precision => 20, :scale => 4
      t.string :currency, :null => false, :limit => 3
      t.text :status, :null => false, :limit => 12
      t.datetime :period_start
      t.datetime :period_end
      t.datetime :due_date
      t.timestamps
    end
  end
end
