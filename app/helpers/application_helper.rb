module ApplicationHelper

def novo_comentario(comentavel)
	raw render(:partial => "comentarios/novo_comentario", :locals => { :comentavel => comentavel })
end


def comentarios(comentavel)
  comentarios = "<h3>Comentarios</h3>"
  comentarios << "<div id='comentarios'>"
  if comentavel.comentarios.any?
    comentarios << render(:partial => "comentarios/comentario", :collection => comentavel.comentarios)
  end
  comentarios << "</div>"
  raw comentarios
end

def menu_principal
  menu = %w(cliente qualificacao restaurante)
  menu_principal = "<ul>"
  menu.each do |item|
    menu_principal << "<li>" + link_to(item, :controller => item.pluralize) + "</li>"
  end
  menu_principal << "</ul>"
  raw menu_principal
end

def valor_formatado(number)
	number_to_currency(number, :unit => "R$", :separator => ",", :delimiter => ".")
end

end
