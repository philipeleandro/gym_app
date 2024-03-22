# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExercisesController, type: :system do
  context 'when an exercise is deleted' do
    let!(:exercise) { create(:exercise, name: 'Supinho reto', muscle_id: 1) }

    before do
      visit users_path
      click_on 'Músculos e Exercicios'
      click_on 'Apagar'
    end

    it 'with success' do
      expect(page).to have_current_path(list_muscles_and_exercises_path)
      expect(page).to have_content('Exercício deletado com sucesso!')
      expect(Exercise.all.count).to eq(0)
    end
  end
end
