# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :system do
  context 'when user visiter users list' do
    context 'when has registered users' do
      let!(:user) { create(:user) }

      it 'with success' do
        visit users_path

        expect(page).to have_content('Lista de usuários')
        expect(page).to have_content('Nome')
        expect(page).to have_content('Ação')
        expect(page).to have_content(user.name)
      end
    end

    context 'when does not have registered users' do
      it 'returns a message' do
        visit users_path

        expect(page).to have_content('Não há usuários cadastrados')
      end
    end
  end
end
