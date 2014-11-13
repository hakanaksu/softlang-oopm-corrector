class AddStudentsToPaul < ActiveRecord::Migration
  def change
    paul = User.find_by(email: 'mpaul@uni-koblenz.de')
    student_list_names = ["sbrinke", "schlossmacher", "schmid", "schmoelzing", "schuerstedt", "sebastiankaul", "sethy", "sgottschalk", "sgross91", "sguhra", "sklaassen", "skollbach", "skoslowski", "skuepper", "slorenz", "slowjaga", "smarx01", "smitzlaff", "speuker", "sschneidereit", "sschoor", "sschwaiger", "ssingh", "stadager", "stefanstrueder", "szaft", "szpa2702", "teberth", "temesinko", "tfroembgen", "tgaefgen", "tgebhardt", "tguder", "thom", "thosenk", "tkolbenschlag", "tkolits", "tlange", "tnolden", "tobimueller", "torstenkaiser", "tpajaczek", "tpriester", "tretterath", "tschoch", "uhlmann", "valentinjohann", "vgerhard", "vivic", "vluing", "vonjutrzenka", "vschueller01", "werle", "wildhirt", "willems", "ymelcher", "ynoack", "yschnei", "zand", "zkou", "zurutza1", "pbeick", "pcschueller", "pdensing", "pdimitrov", "pmarohn", "pmueller01", "promboy", "pslosharek", "qaisnamet", "ramonroeser", "rehberg26", "reif", "renehackel", "rhartmann", "richter90", "romantoschin", "ronjavinzentz", "rstrauss", "sandreas", "sbenze"]
    student_list_names.each do |student|
      paul.students << Student.find_by(username: student) if paul
    end
  end
end

