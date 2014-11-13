class AddStudentsToNonn < ActiveRecord::Migration
  def change
    nonn = User.find_by(email: 'dnonn@uni-koblenz.de')
    student_list_names = ["ernst", "etenten", "evafriedrich2", "fbreuer", "felixesch", "felixnoll", "fhernandez", "fkaehne", "fkutscher", "flobalzer", "florianretz", "flschneider", "fschall", "fschroers", "fwill", "geraldkrinke", "gutfrucht", "halkenhaeusser", "hammerschmidt", "handabura", "hannahtheis", "hausberger", "hbutz", "hdemir", "hklaffert", "hoerz", "hschwane", "hussam", "ijanssen", "iprojic"]
    student_list_names.each do |student|
      nonn.students << Student.find_by(username: student) if nonn
    end
  end
end
