# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MuscleGroupsController, type: :system do
  let(:user) { create(:user) }
  let(:training_plan) { create(:training_plan, user: user) }
  let!(:muscle_group) { create(:muscle_group, training_plan: training_plan) }

  context 'when user list his exercises' do
    let!(:exercise) { create(:exercise, name: 'Teste', muscle_id: 1) }

    context 'with success' do
      before do
        visit root_path
        click_on 'Usuários'
        click_on 'Fichas'
        click_on 'Detalhes'
        click_on 'Adicionar exercício'
        select 'Teste', from: 'Exercise'
        fill_in 'Set', with: 3
        fill_in 'Repetition', with: 10
        click_on 'Cadastrar'
      end

      it { expect(page).to have_current_path(user_muscle_group_list_path(training_plan.id)) }
      it { expect(page).to have_content('Exercício adicionado a ficha com sucesso!') }
      it { expect(page).to have_content(10) }
      it { expect(page).to have_content(3) }
      it { expect(page).to have_content(exercise.name) }
      it { expect(page).to have_content('Peito') }
    end

    context 'with error' do
      before do
        visit root_path
        click_on 'Usuários'
        click_on 'Fichas'
        click_on 'Detalhes'
        click_on 'Adicionar exercício'
        select '-> PEITO', from: 'Exercise'
        fill_in 'Set', with: 3
        fill_in 'Repetition', with: 10
        click_on 'Cadastrar'
      end

      it { expect(page).to have_current_path(muscle_exercise_new_path(muscle_group_id: muscle_group.id))  }
      it { expect(page).to have_content('Erro ao salvar') }
      it { expect(page).to have_content('Backtrace:') }
    end
  end
end