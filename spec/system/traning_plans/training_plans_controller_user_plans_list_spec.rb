# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TrainingPlansController, type: :system do
  let(:user) { create(:user) }
  let!(:training_plan) { create(:training_plan, user: user) }

  context 'when an user has traning_plans' do
    before do
      visit user_training_plans_path(user)
    end

    it 'with success' do
      expect(page).to have_content('Nome')
      expect(page).to have_content(training_plan.name)
    end
  end

  context 'when an user does not have traning_plans' do
    before do
      training_plan.delete
      visit user_training_plans_path(user)
    end

    it { expect(page).to have_content('Não há fichas cadastradas') }
  end
end
