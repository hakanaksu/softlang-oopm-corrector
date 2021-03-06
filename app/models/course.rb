class Course < ActiveRecord::Base
  include AASM

  # === Relations ===
  has_many :course_to_students
  has_many :students, through: :course_to_students
  has_many :assignments

  # === Callbacks ===
  before_destroy :remove_svn

  # === Misc ===
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

  # === Methods ===
  def svn_student_folders
    Dir.entries("#{Rails.root}/repos/#{self.id}").select { |entry| File.directory? File.join("#{Rails.root}/repos/#{self.id}", entry) and !(entry =='.' || entry == '..' || entry == '.scripts' || entry == '.svn') }
  end

  def revision_number
    %x{cd #{Rails.root}/repos/#{self.id} && svn info | grep Revision}.chomp.strip
  end

  def commit_comment(student_name, assignment_number, pdf_path)
    system "cd #{Rails.root}/repos/#{self.id}/#{student_name}/comments && svn update"
    system "rm -f #{Rails.root}/repos/#{self.id}/#{student_name}/comments/comment_#{assignment_number}.pdf"
    system "cp #{pdf_path} #{Rails.root}/repos/#{self.id}/#{student_name}/comments/comment_#{assignment_number}.pdf"
    system "cd #{Rails.root}/repos/#{self.id}/#{student_name}/comments && svn add * --force && svn commit -m 'added comment #{assignment_number} for #{student_name}' "
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
