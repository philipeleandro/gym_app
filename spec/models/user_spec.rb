# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when user is valid' do
    let(:instance) { build(:user) }

    it { expect(instance.valid?).to eq(true) }
  end

  context 'when user is not valid' do
    let(:instance) { described_class.new }

    it { expect(instance.valid?).to eq(false) }
  end
end
