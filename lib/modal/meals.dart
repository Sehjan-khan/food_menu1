class Meal {
  final String id;
  final String category;
  final String name;
  final String image;
  final List<String> ingredients;
  final List<String> steps;
  final int preparationTime;
  final double price;
  final String type;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegetarian;
  final bool isVegan;

  Meal({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.ingredients,
    required this.steps,
    required this.preparationTime,
    required this.price,
    required this.type,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegetarian,
    required this.isVegan,
  });
}

final List<Meal> meals = [
  Meal(
    id: 'm1',
    name: 'Spaghetti Carbonara',
    image: 'assets/images/Spaghetti Carbonara.jpg',
    category: 'Italian',
    ingredients: [
      'Spaghetti',
      'Eggs',
      'Pancetta',
      'Parmesan cheese',
      'Garlic',
      'Black pepper'
    ],
    steps: [
      'Boil spaghetti.',
      'Cook pancetta with garlic.',
      'Whisk eggs and cheese.',
      'Combine spaghetti with pancetta and egg mixture.',
      'Season with black pepper and serve.'
    ],
    preparationTime: 30,
    price: 350.0,
    type: 'spicy',
    isGlutenFree: true,
    isLactoseFree: false,
    isVegetarian: false,
    isVegan: false,
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegetarian: false,
    isVegan: false,
    id: 'm2',
    name: 'Margherita Pizza',
    image: 'assets/images/Boil spaghetti.jpg',
    category: 'Italian',
    ingredients: [
      'Pizza dough',
      'Tomato sauce',
      'Fresh mozzarella',
      'Basil leaves',
      'Olive oil'
    ],
    steps: [
      'Preheat oven to 220°C.',
      'Roll out dough and spread tomato sauce.',
      'Add mozzarella and basil.',
      'Bake in oven for 10-15 minutes.',
      'Drizzle olive oil and serve.'
    ],
    preparationTime: 20,
    price: 250.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: true,
    isVegetarian: false,
    isVegan: false,
    id: 'm3',
    name: 'Grilled Cheese Sandwich',
    image: 'assets/images/m3.jpg',
    category: 'Quick & Easy',
    ingredients: [
      'Bread',
      'Cheese',
      'Butter'
    ],
    steps: [
      'Butter the bread on both sides.',
      'Place cheese between two slices of bread.',
      'Grill on both sides until golden brown.'
    ],
    preparationTime: 10,
    price: 120.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegetarian: true,
    isVegan: false,
    id: 'm4',
    name: 'Egg Salad',
    image: 'assets/images/m4.jpg',
    category: 'Quick & Easy',
    ingredients: [
      'Eggs',
      'Mayonnaise',
      'Mustard',
      'Salt',
      'Pepper'
    ],
    steps: [
      'Boil eggs and chop them.',
      'Mix with mayonnaise, mustard, salt, and pepper.',
      'Serve chilled.'
    ],
    preparationTime: 15,
    price: 150.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegetarian: false,
    isVegan: true,
    id: 'm5',
    name: 'Classic Beef Burger',
    image: 'assets/images/m5.jpg',
    category: 'Hamburgers',
    ingredients: [
      'Ground beef',
      'Burger buns',
      'Cheese',
      'Lettuce',
      'Tomato',
      'Onion',
      'Pickles'
    ],
    steps: [
      'Form beef patties and grill them.',
      'Toast burger buns.',
      'Assemble the burger with cheese, lettuce, tomato, onion, and pickles.'
    ],
    preparationTime: 25,
    price: 400.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: true,
    isLactoseFree: false,
    isVegetarian: false,
    isVegan: false,
    id: 'm6',
    name: 'Chicken Burger',
    image: 'assets/images/m6.jpg',
    category: 'Hamburgers',
    ingredients: [
      'Chicken breast',
      'Burger buns',
      'Lettuce',
      'Tomato',
      'Mayonnaise'
    ],
    steps: [
      'Grill the chicken breast.',
      'Toast the buns.',
      'Assemble with lettuce, tomato, and mayonnaise.'
    ],
    preparationTime: 20,
    price: 300.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: true,
    isVegetarian: false,
    isVegan: false,
    id: 'm7',
    name: 'Bratwurst',
    image: 'assets/images/Italian.jpg',
    category: 'German',
    ingredients: [
      'Bratwurst sausage',
      'Sauerkraut',
      'Mustard',
      'Bread'
    ],
    steps: [
      'Grill or fry bratwurst sausages.',
      'Serve with sauerkraut and mustard.'
    ],
    preparationTime: 20,
    price: 350.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegetarian: true,
    isVegan: false,
    id: 'm8',
    name: 'Sauerbraten',
    image: 'assets/images/Italian.jpg',
    category: 'German',
    ingredients: [
      'Beef roast',
      'Onions',
      'Vinegar',
      'Spices',
      'Potatoes'
    ],
    steps: [
      'Marinate beef roast in vinegar and spices.',
      'Slow cook with onions until tender.',
      'Serve with potatoes.'
    ],
    preparationTime: 180,
    price: 500.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegetarian: false,
    isVegan: true,
    id: 'm9',
    name: 'Grilled Salmon Salad',
    image: 'assets/images/Italian.jpg',
    category: 'Light & Lovely',
    ingredients: [
      'Salmon fillet',
      'Mixed greens',
      'Lemon',
      'Olive oil',
      'Avocado'
    ],
    steps: [
      'Grill salmon fillet.',
      'Toss mixed greens with olive oil and lemon juice.',
      'Serve salmon on top with avocado slices.'
    ],
    preparationTime: 25,
    price: 450.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: true,
    isLactoseFree: false,
    isVegetarian: false,
    isVegan: false,
    id: 'm10',
    name: 'Avocado Toast',
    image: 'assets/images/Italian.jpg',
    category: 'Light & Lovely',
    ingredients: [
      'Bread',
      'Avocado',
      'Olive oil',
      'Lemon',
      'Salt'
    ],
    steps: [
      'Toast the bread.',
      'Mash avocado with lemon and salt.',
      'Spread avocado on the toast and drizzle with olive oil.'
    ],
    preparationTime: 10,
    price: 180.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: true,
    isVegetarian: false,
    isVegan: false,
    id: 'm11',
    name: 'Sushi Rolls',
    image: 'assets/images/Italian.jpg',
    category: 'Exotic',
    ingredients: [
      'Sushi rice',
      'Nori seaweed',
      'Cucumber',
      'Avocado',
      'Fish (tuna or salmon)'
    ],
    steps: [
      'Cook sushi rice and season it.',
      'Roll rice, cucumber, avocado, and fish in nori seaweed.',
      'Slice into bite-sized pieces.'
    ],
    preparationTime: 45,
    price: 600.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegetarian: true,
    isVegan: false,
    id: 'm12',
    name: 'Pad Thai',
    image: 'assets/images/Italian.jpg',
    category: 'Exotic',
    ingredients: [
      'Rice noodles',
      'Tofu or shrimp',
      'Egg',
      'Peanuts',
      'Lime'
    ],
    steps: [
      'Cook rice noodles.',
      'Stir fry tofu or shrimp with egg.',
      'Add noodles and top with peanuts and lime.'
    ],
    preparationTime: 30,
    price: 350.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegetarian: false,
    isVegan: true,
    id: 'm13',
    name: 'Pancakes',
    image: 'assets/images/Italian.jpg',
    category: 'Breakfast',
    ingredients: [
      'Flour',
      'Eggs',
      'Milk',
      'Baking powder',
      'Maple syrup'
    ],
    steps: [
      'Mix flour, eggs, milk, and baking powder.',
      'Cook pancakes on a griddle.',
      'Serve with maple syrup.'
    ],
    preparationTime: 15,
    price: 180.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: true,
    isLactoseFree: false,
    isVegetarian: false,
    isVegan: false,
    id: 'm14',
    name: 'Omelette',
    image: 'assets/images/Italian.jpg',
    category: 'Breakfast',
    ingredients: [
      'Eggs',
      'Cheese',
      'Tomatoes',
      'Spinach'
    ],
    steps: [
      'Whisk eggs and pour into a heated pan.',
      'Add cheese, tomatoes, and spinach.',
      'Cook until set, fold, and serve.'
    ],
    preparationTime: 15,
    price: 100.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: true,
    isVegetarian: false,
    isVegan: false,
    id: 'm15',
    name: 'Dim Sum',
    image: 'assets/images/Italian.jpg',
    category: 'Asian',
    ingredients: [
      'Wonton wrappers',
      'Shrimp',
      'Pork',
      'Vegetables'
    ],
    steps: [
      'Prepare filling with shrimp, pork, and vegetables.',
      'Wrap the filling in wonton wrappers.',
      'Steam the dim sum until cooked.'
    ],
    preparationTime: 40,
    price: 350.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegetarian: true,
    isVegan: false,
    id: 'm16',
    name: 'Fried Rice',
    image: 'assets/images/Italian.jpg',
    category: 'Asian',
    ingredients: [
      'Rice',
      'Eggs',
      'Carrots',
      'Peas',
      'Soy sauce'
    ],
    steps: [
      'Cook rice and set aside.',
      'Stir fry eggs, carrots, and peas.',
      'Add rice and soy sauce, stir fry together.'
    ],
    preparationTime: 20,
    price: 200.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegetarian: false,
    isVegan: true,
    id: 'm17',
    name: 'Croissant',
    image: 'assets/images/Italian.jpg',
    category: 'French',
    ingredients: [
      'Flour',
      'Butter',
      'Yeast',
      'Milk',
      'Sugar'
    ],
    steps: [
      'Prepare dough with flour, yeast, and butter.',
      'Roll out and fold the dough.',
      'Bake until golden brown.'
    ],
    preparationTime: 120,
    price: 250.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: true,
    isLactoseFree: false,
    isVegetarian: false,
    isVegan: false,
    id: 'm18',
    name: 'Quiche Lorraine',
    image: 'assets/images/Italian.jpg',
    category: 'French',
    ingredients: [
      'Pastry crust',
      'Eggs',
      'Cream',
      'Bacon',
      'Cheese'
    ],
    steps: [
      'Prepare crust and bake partially.',
      'Mix eggs, cream, bacon, and cheese.',
      'Pour mixture into crust and bake.'
    ],
    preparationTime: 90,
    price: 400.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: true,
    isVegetarian: false,
    isVegan: false,
    id: 'm19',
    name: 'Fruit Salad',
    image: 'assets/images/Italian.jpg',
    category: 'Summer',
    ingredients: [
      'Watermelon',
      'Strawberries',
      'Blueberries',
      'Mint',
      'Honey'
    ],
    steps: [
      'Chop fruits and mix in a bowl.',
      'Top with mint leaves and honey.'
    ],
    preparationTime: 10,
    price: 180.0,
    type: 'simple',
  ),
  Meal(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegetarian: true,
    isVegan: false,
    id: 'm20',
    name: 'Grilled Veggie Skewers',
    image: 'assets/images/Italian.jpg',
    category: 'Summer',
    ingredients: [
      'Zucchini',
      'Bell peppers',
      'Onions',
      'Olive oil'
    ],
    steps: [
      'Skewer the vegetables.',
      'Grill until tender and slightly charred.'
    ],
    preparationTime: 30,
    price: 250.0,
    type: 'simple',
  ),
];

