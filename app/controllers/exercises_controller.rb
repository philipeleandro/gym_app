# frozen_string_literal: true

class ExercisesController < ApplicationController
  def list_muscles_and_exercises
    @muscles = Exercise.status_ids
  end
end
