# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TrainingPlansController, type: :system do
  let(:user) { create(:user) }
  let!(:training_plan) { create(:training_plan, user: user) }

  context 'when edit a training plan' do
    context 'with success' do
      before do
        visit root_path
        click_on 'Usuários'
        click_on 'Fichas'
        click_on 'Editar'
        fill_in 'Name', with: 'Teste atualizado'
        click_on 'Atualizar'
      end

      it { expect(page).to have_current_path(user_training_plans_path(user.id)) }
      it { expect(page).to have_content('Teste atualizado') }
      it { expect(page).to have_content('Ficha atualizada com sucesso!') }
    end

    context 'when keeps filed empty' do
      before do
        visit root_path
        click_on 'Usuários'
        click_on 'Fichas'
        click_on 'Editar'
        fill_in 'Name', with: ''
        click_on 'Atualizar'
      end

      it { expect(page).to have_current_path(user_plans_edit_path(user_id: user.id, id: training_plan.id)) }
    end
  end
end
