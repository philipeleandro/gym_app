# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :system do
  context 'when an user is deleted' do
    let!(:user) { create(:user) }

    it 'with success' do
      visit users_path
      click_on 'Apagar'

      expect(current_path).to eq(users_path)
      expect(page).to have_content('Usuário deletado com sucesso!')
      expect(User.all.count).to eq(0)
    end
  end
end
