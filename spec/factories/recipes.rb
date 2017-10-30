FactoryGirl.define do
  factory :recipe do
    name "Empanada de carne"
    description "carne, verduras"
    preparation "- picar carne"
    total_calories 200.0
    preparation_time 20

    trait :with_carne_tag do
      after :build do |recipe, _evaluator|
        tag = create(:tag)
        create(:tagging, tag: tag, recipe: recipe)
      end
    end

    trait :with_verdura_tag do
      name "Sopa"
      after :build do |recipe, _evaluator|
        tag = create(:tag, name: "verdura")
        create(:tagging, tag: tag, recipe: recipe)
      end
    end
  end
end
