# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :system do
  context 'when user visiter home page' do
    it 'with success' do
      visit root_path

      expect(page).to have_content 'Home - Bem vindos'
    end
  end
end