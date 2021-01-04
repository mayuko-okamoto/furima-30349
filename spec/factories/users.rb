FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"000abc"}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"田中"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"タナカ"}
    birth_date            {"1930-01-01"}
  end
end
