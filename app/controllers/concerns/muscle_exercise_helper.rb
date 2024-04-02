# frozen_string_literal: true

module MuscleExerciseHelper
  extend ActiveSupport::Concern

  def parse_params(params, key)
    params[key]
  end
end
