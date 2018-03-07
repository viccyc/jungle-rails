require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true  do

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

  scenario "The user can add a product to the cart" do
    # ACT
    visit root_path
    # DEBUG / VERIFY
    expect(page).to have_content('My Cart (0)')

    first('article.product').find_link('Add').click

    expect(page).to have_content('My Cart (1)')
  end
end
