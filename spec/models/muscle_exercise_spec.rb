# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MuscleExercise, type: :model do
  let(:muscle) { create(:muscle) }
  let(:exercise) { create(:exercise) }
  let(:instance) { create(:muscle_exercise, muscle: muscle, exercise: exercise) }

  describe 'validations' do
    context 'when belongs_to' do
      it { is_expected.to belong_to(:muscle) }
      it { is_expected.to belong_to(:exercise) }
      it { is_expected.to validate_presence_of(:set) }
      it { is_expected.to validate_presence_of(:repetition) }
    end

    context 'when must have attribute' do
      it { is_expected.to validate_presence_of(:set) }
      it { is_expected.to validate_presence_of(:repetition) }
    end
  end

  context 'when is valid?' do
    it { expect(instance.valid?).to eq(true) }
  end
end
