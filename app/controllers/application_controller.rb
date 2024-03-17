# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include MuscleGroupHelper
  include TrainingPlanHelper
  include ExerciseHelper
end
