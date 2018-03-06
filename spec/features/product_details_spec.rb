require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They see a product's details" do
    # ACT
    visit root_path
    # DEBUG / VERIFY
    first('article.product').find_link('Details').click
    expect(page).to have_current_path (product_path(Product.first))
    expect(page).to have_css 'article.product-detail'
  end

end
