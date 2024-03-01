# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MuscleGroup, type: :model do
  let(:user) { create(:user) }
  let(:training_plan) { create(:training_plan, user: user) }
  let(:muscle_group) { build(:muscle_group, training_plan: training_plan) }

  context 'when muscle_group is valid' do
    it { expect(muscle_group.valid?).to eq(true) }
  end

  context 'when muscle_group is not valid' do
    context 'when muscle_group does have name' do
      let(:muscle_group) { build(:muscle_group, name: nil, training_plan: training_plan) }

      it { expect(muscle_group.valid?).to eq(false) }
    end

    context 'when muscle_group does training_plan name' do
      let(:muscle_group) { build(:training_plan) }

      it { expect(muscle_group.valid?).to eq(false) }
    end
  end
end
