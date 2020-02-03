# Product.create!([
#   {name: "Monster: Goth Cherry", price: "4.0", image_url: "monster_cherry.url", description: "cough syrup in hell", in_stock: nil},
#   {name: "Monster: Hyper Orange", price: "3.0", image_url: "monster_cherry.url", description: "more like agent orange", in_stock: nil},
#   {name: "\"Monster: Impeachment\"", price: "5.0", image_url: "\"https://images.app.goo.gl/HZjW9ALzy6eeL9K57\"", description: "\"Orange, orange, orange\"", in_stock: nil},
#   {name: "\"Monster: Impeachment\"", price: "5.0", image_url: "\"https://images.app.goo.gl/HZjW9ALzy6eeL9K57\"", description: "\"Orange, orange, orange\"", in_stock: nil},
#   {name: "Monster: Flamin' Peach", price: "3.0", image_url: "https://images.app.goo.gl/KU6obhAjVGJYHGSX9", description: "disgusting", in_stock: nil}
# ])

Category.create(name: "Gross")
Category.create(name: "Unregulated")
Category.create(name: "Poisonous")
Category.create(name: "Experimental")

ProductCategory.create(product_id: 3, category_id: 1)
ProductCategory.create(product_id: 3, category_id: 3)

# [[1, "Gross"], 
# [2, "Unregulated"], 
# [3, "Poisonous"], 
# [4, "Experimental"]]

# [[3, "\"Monster: Impeachment\""], 
# [1, "Monster: Goth Cherry"], 
# [2, "Monster: Hyper Orange"], 
# [4, "\"Monster: Impeachment\""], 
# [5, "Monster: Flamin' Peach"], 
# [6, "banana"], 
# [7, "mangosteen"], 
# [8, "dragonfruit"]]

ProductCategory.create[product_id: 1, category_id: 3]
ProductCategory.create[product_id: 2, category_id: 1]
ProductCategory.create[product_id: 3, category_id: 3]
ProductCategory.create[product_id: 4, category_id: 4]
ProductCategory.create[product_id: 5, category_id: 2]
ProductCategory.create[product_id: 6, category_id: 3]
ProductCategory.create[product_id: 7, category_id: 1]
ProductCategory.create[product_id: 8, category_id: 2]
#for each of your products, make at least one category
#one product at least needs multiple categories