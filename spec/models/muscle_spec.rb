require 'rails_helper'

RSpec.describe Muscle, type: :model do
  let(:user) { create(:user) }
  let(:training_plan) { create(:training_plan, user: user) }
  let(:muscle_group) { create(:muscle_group, training_plan: training_plan) }
  let(:instance) { build(:muscle, muscle_group: muscle_group) }

  context 'when muscle is valid' do
    it { expect(instance.valid?).to eq(true) }
  end

  context 'when muscle is not valid' do
    context 'when muscle does have muscle_group' do
      let(:instance) { build(:muscle) }

      it { expect(instance.valid?).to eq(false) }
    end

    context 'when muscle does have name' do
      let(:instance) { build(:muscle, muscle_group: muscle_group, name: nil) }

      it { expect(instance.valid?).to eq(false) }
    end
  end
end
