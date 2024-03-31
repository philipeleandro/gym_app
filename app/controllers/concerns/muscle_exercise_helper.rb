# frozen_string_literal: true

module MuscleExerciseHelper
  extend ActiveSupport::Concern

  def parse_params(params, key)
    params[key]
  end

  def training_plan(muscle_group_id)
    MuscleGroup.find(muscle_group_id).training_plan.id
  end
end
