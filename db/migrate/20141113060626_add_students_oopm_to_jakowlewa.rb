class AddStudentsOopmToJakowlewa < ActiveRecord::Migration
  def change
    jakowlewa = User.find_by(email: 'jakowlewa@uni-koblenz.de')
    student_list_names = ["abaier", "adallwig", "adrianbuchinger", "adueck01", "aemmerichs", "agessler", "ahelbach", "ahelmer", "ahergenroeth", "aileengraichen", "akammerloch", "akayaloglu", "akerz", "albast", "alepp", "alexanderbeutel", "alikaya", "alinablenz", "anjafoerster", "aschmittgen", "asonntag", "astuplich", "athies", "athomas01", "babayigit92", "bbermel", "beckerfelix", "benegeiger", "bepp", "bkranz", "btalagune", "buchhold", "calberts", "cglowienka", "chreusch", "chrisbauer", "christianbraun", "ckorbach", "ckruck", "claassennils", "cschaeffner", "cschramm", "danielschmidt", "dasilva", "deividasses", "dennisneuf", "dfoerderer", "dfreiberger", "dleiendecker", "dlle", "dnnguyen", "dnonn", "dpiechaczek", "dremagen", "dstade", "dsteil", "dvolz", "ebrehm", "eisenmenger", "ejkraft", "emmafleming", "janarenz", "janfaulde", "janinebuchholz", "jborsch", "jdengel", "jenniferseul", "jfarnkopf", "jfouquet", "jgrimm", "jgrimmig", "jklein94", "jlange", "jlemgen", "johannesbraun", "johannesfix", "jonasblatt", "jpalm", "jpleitz", "jrossmark", "jsauer"]
    student_list_names.each do |student|
      jakowlewa.students << Student.find_by(username: student) if jakowlewa
    end
  end
end