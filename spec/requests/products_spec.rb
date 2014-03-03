require 'spec_helper'

describe "Products" do
	before do
		@product = Product.create name: 'SSD Disk', description: 'A faster SSD Disk', registered_at: '01/03/2014', manufacturer: 'Terabyte', stock: 100
	end

	include Capybara::DSL

	describe "GET /products" do
    	it "display some products" do
			visit products_path
			page.should have_content 'SSD Disk'
		end

		it "creates a new task" do
			visit products_path

			fill_in 'Name', :with => 'SurfaceRT 2'
			fill_in 'Description', :with => 'Best tablet in the market'
			fill_in 'Manufacturer', :with => 'Microsoft'
			fill_in 'Stock', :with => 100
			click_button 'Create Product'

			current_path.should == products_path
			page.should have_content 'SurfaceRT 2'

			save_and_open_page
		end
  	end
	
	describe "PUT /products" do
		it "edit a task" do
			visit products_path
			click_link 'Edit'

			current_path.should == edit_product_path(@product)
			page.should have_content 'SSD Disk'

			fill_in 'Name', :with => 'SDD Disk 2'
			click_button 'Update product'

			current_path.should == products_path

			page.should have_content 'SSD Disk 2'
		end
	end
end
