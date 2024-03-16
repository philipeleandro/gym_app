# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MuscleGroupsController, type: :system do
  let(:user) { create(:user) }
  let!(:training_plan) { create(:training_plan, user: user) }

  context 'when create a new muscle_group' do
    context 'with success' do
      before do
        visit root_path
        click_on 'Usuários'
        click_on 'Fichas'
        click_on 'Detalhes'
        click_on 'Criar grupo muscular'
        fill_in 'Name', with: 'Teste'
        click_on 'Cadastrar'
      end

      it { expect(page).to have_current_path(user_muscle_group_list_path(training_plan)) }
      it { expect(page).to have_content('Grupo muscular criado com sucesso!') }
      it { expect(page).to have_content('Teste') }
    end

    context 'when user not to fill a field' do
      before do
        visit root_path
        click_on 'Usuários'
        click_on 'Fichas'
        click_on 'Detalhes'
        click_on 'Criar grupo muscular'
        fill_in 'Name', with: ''
        click_on 'Cadastrar'
      end

      it { expect(page).to have_current_path(muscle_groups_new_path(training_plan_id: training_plan.id)) }
      it { expect(page).to have_content('Erro ao cadastrar grupo muscular!') }
    end
  end
end
