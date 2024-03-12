# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TrainingPlansController, type: :system do
  let!(:user) { create(:user) }

  context 'when create a new training plan' do
    context 'with success' do
      before do
        visit root_path
        click_on 'Usuários'
        click_on 'Criar ficha'
        fill_in 'Name', with: 'Teste'
        click_on 'Cadastrar'
      end

      it { expect(page).to have_current_path(user_training_plans_path(user.id)) }
      it { expect(page).to have_content('Teste') }
      it { expect(page).to have_content('Ficha criada com sucesso!') }
    end

    context 'when user not to fill a field' do
      before do
        visit root_path
        click_on 'Usuários'
        click_on 'Criar ficha'
        fill_in 'Name', with: ''
        click_on 'Cadastrar'
      end

      it { expect(page).to have_current_path(training_plan_new_path(user.id)) }
      it { expect(page).to have_content('Cadastro de nova ficha') }
    end
  end
end
