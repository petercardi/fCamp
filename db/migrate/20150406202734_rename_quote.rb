class RenameQuote < ActiveRecord::Migration
  def change
    rename_column :quotes, :quote, :quotation
  end
end
