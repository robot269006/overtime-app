FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Some Rationale"
    overtime_request 1.5
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Some more content"
    overtime_request 1.5
    user
  end

  factory :post_from_other_user, class: "Post" do
    date Date.yesterday
    rationale "Some more content"
    overtime_request 1.5
    non_authorized_user
  end

end
