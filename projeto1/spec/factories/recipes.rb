FactoryBot.define do
  factory :recipe do
    title { "Bolo de Cenoura" }
    cook_time { 50 }
    ingredients { "Farinha, fermento, cenoura, margarina" }
    cook_method { "Mistura tudo" }
  end
end
