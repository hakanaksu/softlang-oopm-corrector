class AddSvnUrlToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :svn_url, :string, after: :name
  end
end
