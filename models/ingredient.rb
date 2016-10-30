
class Ingredient
	attr_accessor :type, :price

	def initialize(args = {})
		@type = args.fetch(:type)
		@price = args.fetch(:price)
	end
end
