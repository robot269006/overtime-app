require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title called posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = FactoryGirl.build_stubbed(:post)
      post2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)
    end

    it 'has a scope so that only post creators can see their posts' do
      post1 = FactoryGirl.build_stubbed(:post)
      post2 = FactoryGirl.build_stubbed(:second_post)
      non_authorized_user = User.create(first_name: 'Non', last_name: 'Authorized', email: "nonauth@test.com",password: "asdfasdf", password_confirmation: "asdfasdf")
      post_from_other_user = Post.create(date: Date.today, rationale: "asdf", user_id: non_authorized_user.id)
      byebug
    end

  end

  describe 'new' do
    it 'has a link to homepage' do
      visit root_path
      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      @post = FactoryGirl.create(:post)
      visit posts_path
      click_link("delete_post_#{@post.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"
      expect(page).to have_content("Some rationale")
    end

    it 'will have a user associated to a post' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User_association"
      # "User_association" is written so that test can be run based on that "User_association" text
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User_association")
    end
  end

  describe 'edit' do
    before do
      @edit_user = User.create(first_name: "asdf", last_name: "asdf", email: "asdfasdf@asdf.com", password: "asdfasdf", password_confirmation: "asdfasdf")
      login_as(@edit_user, :scope => :user)
      @edit_post = Post.create(date: Date.today, rationale: "asdf", user_id: @edit_user.id)
    end

    it 'can be edited' do
      visit edit_post_path(@edit_post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"
      expect(page).to have_content("Edited content")
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, scope: :user)
      visit edit_post_path(@edit_post)
      expect(current_path).to eq(root_path)
    end
  end

end
