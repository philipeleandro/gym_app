# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExercisesController, type: :system do
  context 'when an exercise is created' do
    context 'with success' do
      before do
        visit root_path
        click_on 'Músculos e Exercicios'
        click_on 'Adicionar'
        fill_in 'Name', with: 'Supino reto'
        select 'Peito', from: 'Muscle'
        click_on 'Cadastrar'
      end

      it { expect(page).to have_content('Peito') }
      it { expect(page).to have_content('Supino Reto') }
      it { expect(Exercise.all.count).to eq(1) }
    end

    context 'when has error' do
      before do
        visit root_path
        click_on 'Músculos e Exercicios'
        click_on 'Adicionar'
        fill_in 'Name', with: ''
        select 'Peito', from: 'Muscle'
        click_on 'Cadastrar'
      end

      it { expect(page).to have_content('Verifique os erros abaixo:') }
      it { expect(Exercise.all.count).to eq(0) }

      context 'when has same exercise' do
        let!(:exercise) { create(:exercise, name: 'Supino declinado', muscle_id: 1) }

        before do
          visit root_path
          click_on 'Músculos e Exercicios'
          click_on 'Adicionar'
          fill_in 'Name', with: 'Supino declinado'
          select 'Peito', from: 'Muscle'
          click_on 'Cadastrar'
        end

        it { expect(page).to have_content('Verifique os erros abaixo:') }
        it { expect(Exercise.all.count).to eq(1) }
      end
    end
  end
end
