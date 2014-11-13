class AddStudentsToMeffert < ActiveRecord::Migration
  def change
    meffert = User.find_by(email: 'maxmeffert@uni-koblenz.de')
    student_list_names = ["jvanwijlick", "jwinkler", "kaffine", "kazamanova", "kboerner", "kisaak", "kkoppmair", "kschmidt94", "kschwarz01", "kwagner", "landau", "larsbengel", "lbaulig", "leonmoskopp", "lgalego", "lillinguyen", "lreinold", "lstadtfeld", "lucashilbig", "luisdjordan", "lupaulsen", "maikevanlimbeck", "marcel56341", "marcschloesser", "marcschmidt1000", "marcwilhelmy", "martj", "marvhopp", "marvinforster", "mathiasfranz", "mathiasgoebel", "maxmeffert", "mbecker01", "mblaurock", "mblazevic", "mblettner", "mbougherf", "mbusch", "mcornely", "mdamrath", "mgreber", "mguengoer", "mhaen", "mhassel1", "mhemminger", "mhillesheim", "mhuebel", "mildes", "minschloen", "miro", "mkesselheim", "mkikolli", "mkilian", "mkollmer", "mkraemer", "mmappes", "mmichels", "mmints", "mmonschau", "mmue", "mmuerlebach", "nprueller", "ntomkowitz", "ntrimborn", "nwinkler", "nzick", "ojannaschk", "okanbektasoglu", "oliverplauk", "ottosichert", "pascalsonntag", "jscherer", "jschleder", "jschneider", "jschrader", "jschroeter", "jschulze", "jschumacher94", "jthielen", "jtomasetti", "julrich"]
    student_list_names.each do |student|
      meffert.students << Student.find_by(username: student) if nonn
    end
  end
end
