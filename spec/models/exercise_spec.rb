require 'rails_helper'

RSpec.describe Exercise, type: :model do
  let(:user) { create(:user) }
  let(:training_plan) { create(:training_plan, user: user) }
  let(:muscle_group) { create(:muscle_group, training_plan: training_plan) }
  let(:muscle) { create(:muscle, muscle_group: muscle_group) }
  let(:instance) { build(:exercise, muscle: muscle) }

  context 'when exercise is valid' do
    it { expect(instance.valid?).to eq(true) }
  end

  context 'when exercise is not valid' do
    context 'when exercise does have muscle' do
      let(:instance) { build(:exercise) }

      it { expect(instance.valid?).to eq(false) }
    end

    context 'when exercise does have reps' do
      let(:instance) { build(:exercise, repetition: nil, muscle: muscle) }

      it { expect(instance.valid?).to eq(false) }
    end

    context 'when exercise does have set' do
      let(:instance) { build(:exercise, set: nil, muscle: muscle) }

      it { expect(instance.valid?).to eq(false) }
    end

    context 'when exercise does have name' do
      let(:instance) { build(:exercise, muscle: muscle, name: nil) }

      it { expect(instance.valid?).to eq(false) }
    end
  end
end
