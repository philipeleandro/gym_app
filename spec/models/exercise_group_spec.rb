# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExerciseGroup, type: :model do
  let(:user) { create(:user) }
  let(:training_plan) { create(:training_plan, user: user) }
  let(:muscle_group) { create(:muscle_group, training_plan: training_plan) }
  let(:muscle) { create(:muscle) }
  let(:exercise) { create(:exercise) }
  let(:muscle_exercise) { create(:muscle_exercise, muscle: muscle, exercise: exercise) }
  let(:instance) { build(:exercise_group, muscle_exercise: muscle_exercise, muscle_group: muscle_group) }

  describe 'validations' do
    context 'when is valid' do
      it { expect(instance.valid?).to eq(true) }
    end

    context 'when is not valid' do
      context 'when does not have muscle_exercise' do
        let(:instance) { build(:exercise_group, muscle_group: muscle_group) }

        it { expect(instance.valid?).to eq(false) }
      end

      context 'when does not have muscle_group' do
        let(:instance) { build(:exercise_group, muscle_exercise: muscle_exercise) }

        it { expect(instance.valid?).to eq(false) }
      end
    end
  end
end
