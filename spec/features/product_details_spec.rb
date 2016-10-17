require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

 # SETUP
   before :each do
     @category = Category.create! name: 'Apparel'

     10.times do |n|
       @category.products.create!(
         name:  Faker::Hipster.sentence(3),
         description: Faker::Hipster.paragraph(4),
         image: open_asset('apparel1.jpg'),
         quantity: 10,
         price: 64.99
       )
     end
   end

 scenario "They visit a product detail page" do
   # ACT
   visit root_path

   page_text = page.all('article.product a').first.text
   click_link(page_text)

   sleep(8)

   # DEBUG / VERIFY
   save_screenshot
   expect(page).to have_css 'section.products-show', count: 1
   expect(page).to have_css 'article.product-detail', count: 1

 end
end
