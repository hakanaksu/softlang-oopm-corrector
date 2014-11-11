class Course < ActiveRecord::Base
  include AASM

  has_many :course_to_students
  has_many :students, through: :course_to_students
  has_many :assignments

  before_destroy :remove_svn

  aasm column: 'svn_status' do
    state :not_checked_out, initial: true
    state :checked_out

    event :checkout_svn, after: :svn_checkout do
      transitions from: :not_checked_out, to: :checked_out
    end

    event :update_svn, after: :svn_update do
      transitions from: :checked_out, to: :checked_out
    end
  end

  def svn_student_folders
    Dir.entries("#{Rails.root}/repos/#{self.id}").select { |entry| File.directory? File.join("#{Rails.root}/repos/#{self.id}", entry) and !(entry =='.' || entry == '..' || entry == '.scripts' || entry == '.svn') }
  end

  def revision_number
    %x{cd #{Rails.root}/repos/#{self.id} && svn info | grep Revision}.chomp.strip
  end

  private

  def remove_svn
    system "cd #{Rails.root}/repos && rm -rf #{self.id}"
  end

  def svn_checkout
    system "cd #{Rails.root}/repos/ && svn checkout #{self.svn_url} #{self.id}"
  end

  def svn_update
    system "cd #{Rails.root}/repos/#{self.id} && svn update"
  end

end
