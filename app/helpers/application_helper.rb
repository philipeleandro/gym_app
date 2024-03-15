# frozen_string_literal: true

module ApplicationHelper
  def update_or_create
    request.url.include?('/edit') ? 'Atualizar' : 'Cadastrar'
  end
end
