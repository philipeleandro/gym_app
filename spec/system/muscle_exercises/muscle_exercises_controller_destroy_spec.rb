# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MuscleExercisesController, type: :system do
  let(:user) { create(:user) }
  let(:training_plan) { create(:training_plan, user: user) }
  let!(:muscle_group) { create(:muscle_group, training_plan: training_plan) }

  context 'when user list his exercises' do
    let!(:exercise) { create(:exercise, name: 'Teste', muscle_id: 1) }
    let(:muscle_exercise) { create(:muscle_exercise, exercise: exercise, repetition: 10, set: 3) }
    let!(:exercise_group) { create(:exercise_group, muscle_group: muscle_group, muscle_exercise: muscle_exercise) }

    context 'with success' do
      before do
        visit root_path
        click_on 'Usuários'
        click_on 'Fichas'
        click_on 'Detalhes'
        within all('#delete_exercise_on_muscle_group').first do
          click_on 'Apagar'
        end
      end

      it { expect(page).to have_current_path(user_muscle_group_list_path(training_plan.id)) }
      it { expect(page).to have_content('Exercício deletado com sucesso!') }
      it { expect(MuscleExercise.all.count).to eq(0) }
    end
  end
end
