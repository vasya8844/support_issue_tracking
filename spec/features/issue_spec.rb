require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      visit new_issue_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of message' do
      expect(page).to have_content(/New Issue/)
    end
  end

  describe 'creation' do
    before do
      visit new_issue_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      desc = 'is have problem with hosting'
      fill_in 'issue[description]', with: desc
      fill_in 'issue[reporter_email]', with: 'test1@test.com'
      click_on 'Create Issue'

      expect(page.status_code).to eq(200)
      expect(page).to have_content("Description: #{desc}")
    end
  end
end