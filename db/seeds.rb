# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jenna = User.create(
  username: 'wafflesRlife',
  password: 'password',
  name: 'Jenna',
  location: 'Denver, Colorado',
  profile_photo: 'https://i.imgur.com/n6acLBS.jpg'
)

rufio = User.create(
  username: 'doopwafel',
  password: 'iamcat',
  name: 'Rufio',
  location: 'Denver, Colorado',
  profile_photo: 'https://i.imgur.com/cCwtBNI.jpg'
)

snacks = Snack.create([
  {
    name: 'Matcha Kit Kat',
    description: 'matcha green tea flavored chocolate covered wafer fingers',
    origin: 'Japan',
    image: 'https://i.imgur.com/NIH9zMH.jpg',
    categories: ['chocolate', 'sweet'],
    status: 'undecided'
  },
  {
    name: 'Kit Kat Gold',
    description: 'wafer fingers covered in deliciously smooth golden caramelized white chocolate',
    origin: 'Canada',
    image: 'https://i.imgur.com/KgfnnAM.jpg',
    categories: ['chocolate', 'sweet', 'creamy'],
    status: 'undecided'
  },
  {
    name: "Kit Kat Senses Millionaire's Shortbread",
    description: 'crispy wafer bars with an indulgent layer of thick, creamy filling infused with crunchy caramel pieces',
    origin: 'UK',
    image: 'https://i.imgur.com/zVxnaF0.jpg',
    categories: ['chocolate', 'sweet', 'crunchy'],
    status: 'undecided'
  },
  {
    name: 'Pringle Stax Coconut Purple Yam',
    description: 'coconut and yam flavored Pringle chips',
    origin: 'China',
    image: 'https://i.imgur.com/QN6RyZu.png',
    categories: ['salty', 'crunchy'],
    status: 'undecided'
  },
  {
    name: 'Pringle Stax Avocado and Sweet Mustard',
    description: 'avocado and mustard flavored Pringle chips',
    origin: 'China',
    image: 'https://i.imgur.com/rvFjHiY.png',
    categories: ['salty', 'crunchy', 'tangy'],
    status: 'undecided'
  },
  {
    name: 'Cheetos American Turkey',
    description: 'turkey leg flavored cheetos? yeah, idk.',
    origin: 'China',
    image: 'https://i.imgur.com/g9vfyKW.jpg',
    categories: ['salty', 'crunchy', 'cheesy'],
    status: 'undecided'
  },
  {
    name: 'Oreo Crispy Sakura Chiffon Cake',
    description: 'limited edition - contain a sakura-flavored cream filling with a subtle hint of saltiness',
    origin: 'Japan',
    image: 'https://i.imgur.com/ZC1EN3t.jpg',
    categories: ['sweet', 'crispy'],
    status: 'undecided'
  },
  {
    name: 'Oreo Crispy Vanilla Mousse',
    description: 'limited edition - released as part of the 30th anniversary celebration of Oreo in Japan, have an creamy vanilla mousse center',
    origin: 'Japan',
    image: 'https://i.imgur.com/Jyl6mTp.jpg',
    categories: ['sweet', 'crispy', 'creamy'],
    status: 'undecided'
  },
  {
    name: 'Arizona All Natural Fruit Snacks',
    description: 'Arizona Tea all natural fruit snacks, flavors include: Fruit Punch, Mucho Mango, Watermelon',
    origin: 'USA',
    image: 'https://i.imgur.com/LeW8Xef.jpg',
    categories: ['sweet', 'chewy', 'juicy'],
    status: 'undecided'
  },
  {
    name: 'Maynards Gourmet Wine Gums',
    description: 'non-alcoholic, fruity tastes inspired by rum, cognac, brandy and other choice spirits',
    origin: 'UK',
    image: 'https://i.imgur.com/NJLwJrH.jpg',
    categories: ['sweet', 'chewy', 'juicy'],
    status: 'undecided'
  },
  {
    name: 'Hapi Spicy Sriracha Peas',
    description: 'roasted green peas coated with chili and garlic',
    origin: 'Thailand',
    image: 'https://i.imgur.com/p1vi0w0.jpg',
    categories: ['spicy', 'crunchy', 'salty'],
    status: 'undecided'
  },
  {
    name: 'Hapi Mixed Rice Crackers',
    description: 'an array of rice crackers made with soy sauce, rice, seaweed, green peas, sesame seeds and spices ',
    origin: 'Thailand',
    image: 'https://i.imgur.com/5uneXzQ.jpg',
    categories: ['savory', 'crunchy', 'salty'],
    status: 'undecided'
  },
  {
    name: "Tunnock's Milk Chocolate Caramel Wafers",
    description: 'light and crispy wafer cookies filled with layers of caramel and completely enveloped in rich milk chocolate',
    origin: 'UK',
    image: 'https://i.imgur.com/JqddI8u.jpg',
    categories: ['sweet', 'chewy', 'chocolate'],
    status: 'undecided'
  }
])

Review.create(user_id: jenna.id, content: "Why are these dang things so good!! Extra excellent with a coffee.", rating: 5, snack_id: snacks.last.id)
Review.create(user_id: jenna.id, content: "I am a sucker to matcha green tea flavored foods, this kit kat is pretty solid.", rating: 4, snack_id: snacks.first.id)

