# frozen_string_literal: true

module TrainingPlanHelper
  def method_patch_or_edit
    return :patch if edit_request?

    :post
  end

  def edit_request?
    request.url.include?('/edit')
  end
end
