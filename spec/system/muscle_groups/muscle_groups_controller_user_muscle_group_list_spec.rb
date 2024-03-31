# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MuscleGroupsController, type: :system do
  let(:user) { create(:user) }
  let(:training_plan) { create(:training_plan, user: user) }
  let!(:muscle_group) { create(:muscle_group, training_plan: training_plan) }

  context 'when user list his exercises' do
    context 'with success' do
      let(:exercise) { create(:exercise, name: 'Teste', muscle_id: 1) }
      let(:muscle_exercise) { create(:muscle_exercise, exercise: exercise, repetition: 10, set: 3) }
      let!(:exercise_group) { create(:exercise_group, muscle_group: muscle_group, muscle_exercise: muscle_exercise) }

      before do
        visit root_path
        click_on 'Usuários'
        click_on 'Fichas'
        click_on 'Detalhes'
      end

      it { expect(page).to have_content(10) }
      it { expect(page).to have_content(3) }
      it { expect(page).to have_content(exercise.name) }
      it { expect(page).to have_content('Peito') }
    end

    context 'when user does not have exercises' do
      before do
        visit root_path
        click_on 'Usuários'
        click_on 'Fichas'
        click_on 'Detalhes'
      end

      it { expect(page).to have_content('Não há exercícios cadastrados para esse dia') }
    end
  end
end
