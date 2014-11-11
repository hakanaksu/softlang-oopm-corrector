class AddSvnStatusToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :svn_status, :string, after: :svn_url, default: 'not_checked_out'
  end
end
