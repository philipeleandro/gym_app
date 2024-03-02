# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Muscle, type: :model do
  let(:user) { create(:user) }
  let(:training_plan) { create(:training_plan, user: user) }
  let(:instance) { build(:muscle) }

  context 'when muscle is valid' do
    it { expect(instance.valid?).to eq(true) }
  end

  context 'when muscle is not valid' do
    context 'when muscle does have name' do
      let(:instance) { build(:muscle, name: nil) }

      it { expect(instance.valid?).to eq(false) }
    end

    context 'when name is not unique' do
      let!(:instance_second) { create(:muscle) }

      it { is_expected.to validate_uniqueness_of(:name) }
    end
  end
end
