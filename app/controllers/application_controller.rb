class ApplicationController < ActionController::Base
  protect_from_forgery

  def novo_comentario(comentavel)
    comentarios = render(:partial => "comentarios/novo_comentario", :locals => { :comentavel => comentavel })
    raw comentarios
  end

end
