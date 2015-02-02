class StudentExamAdmissionMailer < ActionMailer::Base

  default from: "erwinschens@uni-koblenz.de"

  def admission_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Zusammenfassung / Klausurzulassung OOPM 14/15')
  end

end
