# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :system do
  context 'when user visiter users list' do
    let(:user) { create(:user) }

    before do
      user
      visit users_path
    end

    context 'when has actions' do
      it { expect(page).to have_content('Ação') }
      it { expect(page).to have_content('Apagar') }
      it { expect(page).to have_content('Fichas') }
    end

    context 'when has registered users' do
      it { expect(page).to have_content('Nome') }
      it { expect(page).to have_content(user.name) }
    end

    context 'when does not have registered users' do
      before do
        user.delete
        visit users_path
      end

      it { expect(page).to have_content('Não há usuários cadastrados') }
    end
  end
end
