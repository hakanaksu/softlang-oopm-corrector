class CommentsController < ApplicationController

  def show
    respond_to do |format|
      format.pdf do
        render :pdf => 'generated_pdf',
               :show_as_html => params[:debug].present?, # allow debugging based on url param
               :page_size => 'A4' # default A4
      end
    end
  end

end