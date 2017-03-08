class Catering < ApplicationRecord

  belongs_to :user, inverse_of: :caterings
  belongs_to :restaurant

  has_many :deliveries

###
# problems to solve:
# lista cateringobiorcow,
# narzedzie dla kierowcy, kto zaplacil, kto nie
# narzedzie do analizy danych (zarzadzania userami)



end
