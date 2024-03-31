# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExercisesController, type: :system do
  let!(:exercise) { create(:exercise, name: 'Supinho reto', muscle_id: 1) }
  let!(:exercise_two) { create(:exercise, name: 'Supinho inclinado', muscle_id: 1) }

  before do
    visit root_path
    click_on 'Músculos e Exercicios'
  end

  context 'when muscle has exercises' do
    it 'with success' do
      expect(page).to have_content('Peito')
      expect(page).to have_content('Supinho Reto')
      expect(page).to have_content('Supinho Inclinado')
    end
  end

  context 'when muscle does not have exercise' do
    it 'with success' do
      expect(page).to have_content('Costas')
      expect(page).to have_content('Não há exercicíos cadastrados para esse músculo')
    end
  end
end
