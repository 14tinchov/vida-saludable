FactoryGirl.define do
  factory :profile do
    first_name "MyString"
    last_name "MyString"
    weight 1.5
    height 1.5
    physical_activity 1
    physical_activity_description "MyText"
    other_diseases "MyText"
    other_pleasures "MyText"
    user nil
  end
end
