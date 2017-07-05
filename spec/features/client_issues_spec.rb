require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      visit new_client_issue_path
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
      visit new_client_issue_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      desc = Faker::Lorem.paragraph
      fill_in 'issue[subject]', with: 'some problem'
      fill_in 'issue[description]', with: desc
      fill_in 'issue[reporter_name]', with: 'some reporter'
      fill_in 'issue[reporter_email]', with: Faker::Internet.email
      click_on 'Create Issue'

      expect(page.status_code).to eq(200)
      expect(page).to have_content("Description: #{desc}")
    end
  end

  describe 'updating' do
    before do
      @issue = FactoryGirl.create :issue
    end

    it 'can be updated' do
      visit edit_by_uu_id_client_issues_path(uu_id: @issue.uu_id)

      new_description = Faker::Lorem.paragraph
      fill_in 'issue[description]', with: new_description
      click_on 'Update Issue'

      expect(page.status_code).to eq(200)
      expect(page).to have_content("Description: #{new_description}")
    end
  end
end