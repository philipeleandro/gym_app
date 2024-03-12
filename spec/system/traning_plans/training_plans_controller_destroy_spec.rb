# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TrainingPlansController, type: :system do
  context 'when an traning plan is deleted' do
    let(:user) { create(:user) }
    let!(:training_plan) { create(:training_plan, user: user) }

    it 'with success' do
      visit users_path
      click_on 'Fichas'
      click_on 'Apagar'

      expect(page).to have_current_path(users_path)
      expect(page).to have_content('Ficha deletada com sucesso!')
      expect(TrainingPlan.all.count).to eq(0)
    end
  end
end
