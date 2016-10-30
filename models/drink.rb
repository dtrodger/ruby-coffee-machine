class Drink
	attr_accessor :name, :req_ingredients, :price, :in_stock

	def initialize(args = {})
		@name = args.fetch(:name)
		@req_ingredients = args.fetch(:req_ingredients) {[]}
	end

	def price
		price = self.req_ingredients.inject(0){|sum, ingredient| sum + (ingredient[0] * ingredient[1].price)}
		'%.2f' % price
	end
end
