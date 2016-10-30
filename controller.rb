require_relative 'models/barista_matic'
require_relative 'models/drink'
require_relative 'models/ingredient'

module BaristaMaticReqs
	def get_barista_matic
		# INITIALIZE INGREDIENTS
		coffee = Ingredient.new({type: 'coffee', price: 0.75})
		decaf_coffee = Ingredient.new({type: 'decaf coffee', price: 0.75})
		sugar = Ingredient.new({type: 'sugar', price: 0.25})
		cream = Ingredient.new({type: 'cream', price: 0.25})
		steamed_milk = Ingredient.new({type: 'steamed milk', price: 0.35})
		foamed_milk = Ingredient.new({type: 'foamed milk', price: 0.35})
		espresso = Ingredient.new({type: 'espresso', price: 1.10})
		cocoa = Ingredient.new({type: 'cocoa', price: 0.90})
		whipped_cream = Ingredient.new({type: 'whipped cream', price: 1.00})

		# INITIALIZE DRINKS
		coffee_drink = Drink.new(
			{
				name: 'Coffee',
				req_ingredients: [
					[3, coffee],
					[1, sugar],
					[1, cream]
				]
			}
		)

		decaf_coffee_drink = Drink.new(
			{
				name: 'Decaf Coffee',
				req_ingredients: [
					[3, decaf_coffee],
					[1, sugar],
					[1, cream]
				]
			}
		)

		caffe_latte = Drink.new(
			{
				name: 'Caffe Latte',
				req_ingredients: [
					[2, espresso],
					[1, steamed_milk]
				]
			}
		)

		caffe_americano = Drink.new(
			{
				name: 'Caffe Americano',
				req_ingredients: [
					[3, espresso],
				]
			}
		)

		caffe_mocha = Drink.new(
			{
				name: 'Caffe Mocha',
				req_ingredients: [
					[1, espresso],
					[1, cocoa],
					[1, steamed_milk],
					[1, whipped_cream]
				]
			}
		)

		cappuccino = Drink.new(
			{
				name: 'Cappuccino',
				req_ingredients: [
					[2, espresso],
					[1, steamed_milk],
					[1, foamed_milk]
				]
			}
		)

		# INITIALIZE BARISTAMATIC
		barista_matic = BaristaMatic.new(
			{
				stocked_ingredients: [
					[10, coffee],
					[10, decaf_coffee],
					[10, sugar],
					[10, cream],
					[10, steamed_milk],
					[10, foamed_milk],
					[10, espresso],
					[10, cocoa],
					[10, whipped_cream]
				],
				drink_options: [
					coffee_drink,
					decaf_coffee_drink,
					caffe_latte,
					caffe_americano,
					caffe_mocha,
					cappuccino,
				]
			}
		)

		return barista_matic
	end
end
