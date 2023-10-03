class RenameOldColumnNameToNewColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :contents, :content, :body
  end
end
