class BuildCaterings

  def initialize
    open_csv
  end

  private

  def open_csv
    CSV.foreach('lib/cateringi.csv', {skip_blanks: true, col_sep: ';'}) do |row|
      parse_row(row)
    end
  end

  def parse_row(row)
    user = get_user(row)
    user.caterings.create!(
        restaurant_id: 1,
        price: price(row[2]),
        calories: row[2],
        comments: row[3]
    )
  end

# def create_catering
# user = get_user
# end
#  id 0  email 1 kcal 2  uwagi 3  phone 4        address 5 city 6 code 7
#   1	 Bat	2000	 	     693392318	 Portiernia Bat	Augustów	16-300

def get_user(row)
  email = row[1].to_url_format.downcase.to_s + '@nawidelcu.fit'
  pass = 'widelec001'
  User.find_or_create_by!(email: email) do |user|
    user.firstname = row[1]
    user.address = row[5]
    user.city = row[6]
    user.post_code = row[7]
    user.password = pass
    user.password_confirmation = pass
  end
  # puts user.errors.messages
  end

  def price(kcal)
    prices = {
        1500 => 40,
        1750 => 43,
        2000 => 46
    }
    prices[kcal]
  end

end