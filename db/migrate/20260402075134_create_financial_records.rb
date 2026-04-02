class CreateFinancialRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :financial_records do |t|
      t.decimal :amount
      t.integer :record_type
      t.string :category
      t.date :date
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
