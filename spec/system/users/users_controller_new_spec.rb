# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :system do
  context 'when an user is created' do
    context 'with success' do
      before do
        visit users_path
        click_on 'Adicionar usuário'
        fill_in 'Name', with: 'Teste'
        click_on 'Cadastrar'
      end

      it { expect(current_path).to eq(users_path) }
      it { expect(page).to have_content('Teste') }
      it { expect(page).to have_content('Usuário cadastrado com sucesso!') }
    end

    context 'when has error' do
      before do
        visit users_path
        click_on 'Adicionar usuário'
        click_on 'Cadastrar'
      end

      it { expect(page).to have_content('Name') }
      it { expect(page).to have_content('Verifique os erros abaixo') }
    end
  end
end
