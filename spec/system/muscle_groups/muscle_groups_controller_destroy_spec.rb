# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MuscleGroupsController, type: :system do
  let(:user) { create(:user) }
  let(:training_plan) { create(:training_plan, user: user) }
  let!(:muscle_group) { create(:muscle_group, training_plan: training_plan) }

  context 'when user has exercise in training plan' do
    let(:exercise) { create(:exercise, name: 'Teste', muscle_id: 1) }
    let(:muscle_exercise) { create(:muscle_exercise, exercise: exercise, repetition: 10, set: 3) }
    let!(:exercise_group) { create(:exercise_group, muscle_group: muscle_group, muscle_exercise: muscle_exercise) }

    context 'when delete with sucess' do
      before do
        visit root_path
        click_on 'Usuários'
        click_on 'Fichas'
        click_on 'Detalhes'
        within all('#delete_muscle_group').first do
          click_on 'Apagar'
        end
      end

      it { expect(page).to have_content('Grupo muscular excluído com sucesso!') }
      it { expect(MuscleExercise.all.reload.count).to eq(0) }
      it { expect(ExerciseGroup.all.reload.count).to eq(0) }
      it { expect(MuscleGroup.all.reload.count).to eq(0) }
    end
  end

  context 'when user does not have exercise in training plan' do
    let(:exercise) { create(:exercise, name: 'Teste', muscle_id: 1) }
    let(:muscle_exercise) { create(:muscle_exercise, exercise: exercise, repetition: 10, set: 3) }

    context 'when delete with sucess' do
      before do
        visit root_path
        click_on 'Usuários'
        click_on 'Fichas'
        click_on 'Detalhes'
        within all('#delete_muscle_group').first do
          click_on 'Apagar'
        end
      end

      it { expect(page).to have_content('Grupo muscular excluído com sucesso!') }
      it { expect(MuscleGroup.all.reload.count).to eq(0) }
    end
  end

  context 'when has error' do
    let(:exercise) { create(:exercise, name: 'Teste', muscle_id: 1) }
    let(:muscle_exercise) { create(:muscle_exercise, exercise: exercise, repetition: 10, set: 3) }
    let(:instance) { ::MuscleGroups::Destroy.new(muscle_group.id) }

    before do
      allow(::MuscleGroups::Destroy).to receive(:new).and_return(instance)
      allow(instance).to receive(:run!).and_raise(StandardError, 'Error')

      visit root_path
      click_on 'Usuários'
      click_on 'Fichas'
      click_on 'Detalhes'
      within all('#delete_muscle_group').first do
        click_on 'Apagar'
      end
    end

    it 'shows up on page' do
      expect(page).to have_content('Error')
    end
  end
end
