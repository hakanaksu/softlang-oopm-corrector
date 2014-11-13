class AddStudentsToMonschau < ActiveRecord::Migration
  def change
    monschau = User.find_by(email: 'mmonschau@uni-koblenz.de')
    student_list_names = ["mogilewski", "monaschwab", "msangl", "mscherer", "mschneichel", "mschneitzer", "mschnorr", "mschrank", "msimon3", "mvonolfen", "mwaechter", "mwinzen", "mwisser", "mwissner", "namthip", "narnoldi", "navid", "ndesgronte", "ndramburg", "neubacherk", "neumannm", "ngocnguyen", "ngottwald", "nicohammann", "niklas", "nikwie", "nillesmax", "nkathmann", "nlehnhaeuser", "nourshahi"]
    student_list_names.each do |student|
      monschau.students << Student.find_by(username: student) if monschau
    end
  end
end
