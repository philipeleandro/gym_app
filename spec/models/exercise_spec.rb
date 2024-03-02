# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Exercise, type: :model do
  let(:instance) { build(:exercise) }

  context 'when exercise is valid' do
    it { expect(instance.valid?).to eq(true) }
  end

  context 'when exercise is not valid' do
    context 'when exercise does have name' do
      let(:instance) { build(:exercise, name: nil) }

      it { expect(instance.valid?).to eq(false) }
    end

    context 'when name is not unique' do
      it { should validate_uniqueness_of(:name) }
    end
  end
end
