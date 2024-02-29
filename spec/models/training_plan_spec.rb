require 'rails_helper'

RSpec.describe TrainingPlan, type: :model do
  context 'when training_plan is valid' do
    let(:user) { create(:user) }
    let(:instance) { build(:training_plan, user: user) }

    it { expect(instance.valid?).to eq(true) }
  end

  context 'when training_plan is not valid' do
    context 'when training_plan does have user' do
      let(:instance) { build(:training_plan) }

      it { expect(instance.valid?).to eq(false) }
    end

    context 'when training_plan does have name' do
      let(:instance) { build(:training_plan, name: nil) }

      it { expect(instance.valid?).to eq(false) }
    end
  end
end
