require 'rails_helper'

feature 'Visting Root' do

  it 'when not logged in redirects to a registration page' do
    visit root_path
    expect('/').to eq(root_path)
  end

  it 'when logged in shows a welcome message'
end
