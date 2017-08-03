class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient }
end


# cocktail
# |id|name|
# | 1|bloody mary|
# | 2|screwdriver|

# doses
# |ingredient_id|cocktail_id|description|
# |            1|          1|       50ml|
# |            2|          1|       80ml|
# |            1|          2|       50ml|

# ingredients
# |id|name|
# | 1|vodka|
# | 2|suco de tomate|
# | 3|suco de laranja|
