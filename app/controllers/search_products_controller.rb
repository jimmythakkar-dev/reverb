class SearchProductsController < ApplicationController
  def index
  	curr_page = params[:page].present? ? params[:page].to_i : 1
  	if params[:uuid].present?
  		listing_url = "https://api.reverb.com/api/categories/#{params[:uuid]}?page=#{curr_page}&per_page=10"
  	else	
  		listing_url = "https://api.reverb.com/api/listings/all?page=#{curr_page}&per_page=10"
		end
  	products = JSON.parse(RestClient.get(listing_url, :content_type => "application/json",
													 		:accept => "application/hal+json",
													 		"accept-version" => "3.0"))

		@products_listings = Kaminari.paginate_array(products["listings"], total_count: products["total"]).page(curr_page).per(10)
  end

  def category_lookup
  	category_url = "https://api.reverb.com/api/categories/flat"
  	categories = JSON.parse(RestClient.get(category_url, :content_type => "application/json",
													 		:accept => "application/hal+json",
													 		"accept-version" => "3.0"))
  	category_hash = Hash.new
  	categories["categories"].each {|category| category_hash[category["name"]] = category["uuid"]}
	 	filtered_categories = category_hash.select {|cat_name, uuid| cat_name[/^#{params[:search_text]}/i]}
  	render json: filtered_categories
  end	
end
