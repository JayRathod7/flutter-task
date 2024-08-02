class ItemModel {
  final String img;
  final String name;
  final String category;
  final int price;

  ItemModel(
      {required this.img,
      required this.name,
      required this.price,
      required this.category});

  static List<ItemModel> categoryList = [];
  static int finalTotal = 0;
}

List<ItemModel> mainMenu = [
  ItemModel(
      img: "assets/food18.jpg",
      name: "Paneer butter masala",
      price: 220,
      category: 'full'),
  ItemModel(
      img: "assets/food17.jpg",
      name: "Gujarati Thali",
      price: 220,
      category: 'full'),
  ItemModel(
      img: "assets/food1.png",
      name: "Special pav bhaji",
      price: 100,
      category: 'pavBhaji'),
  ItemModel(
      img: "assets/food2.jpeg",
      name: "Extra cheezz Pizza",
      price: 120,
      category: 'pizza'),
  ItemModel(
      img: "assets/food5.jpeg",
      name: "Aallu tiki with extra vegetable BURGER",
      price: 60,
      category: 'burger'),
  ItemModel(
      img: "assets/food4.png",
      name: "Regular Burger",
      price: 40,
      category: 'burger'),
  ItemModel(
      img: "assets/food6.png",
      name: "Vegetable Momos",
      price: 60,
      category: 'momo'),
  ItemModel(
      img: "assets/food7.png",
      name: "Boiled momos",
      price: 60,
      category: 'momo'),
  ItemModel(
      img: "assets/food15.jpeg",
      name: "Regular Dosa",
      price: 100,
      category: 'dosa'),
  ItemModel(
      img: "assets/food9.jpeg",
      name: "Hakka noodles",
      price: 60,
      category: 'noodles'),
  ItemModel(
      img: "assets/food21.jpg",
      name: "Special Hakka noodles",
      price: 100,
      category: 'noodles'),
  ItemModel(
      img: "assets/food16.jpeg",
      name: "Peri Peri French Fries",
      price: 100,
      category: 'fries'),
  ItemModel(
      img: "assets/food11.jpeg",
      name: "Potato finger",
      price: 100,
      category: 'fries'),
  ItemModel(
      img: "assets/food12.png",
      name: "Air Fryer French Fries",
      price: 100,
      category: 'fries'),
  ItemModel(
      img: "assets/food20.jpg", name: "Samosa", price: 40, category: 'samosa'),
  ItemModel(
      img: "assets/food8.jpeg", name: "Samosa", price: 30, category: 'samosa'),
  ItemModel(
      img: "assets/food10.jpeg",
      name: "Multi Tier Cakes",
      price: 50,
      category: 'sweet'),
  ItemModel(
      img: "assets/food13.png",
      name: "Strawberry ice cream",
      price: 120,
      category: 'sweet'),
  ItemModel(
      img: "assets/food14.png",
      name: "Three Color Cakes",
      price: 70,
      category: 'sweet'),
  ItemModel(
      img: "assets/food19.jpg", name: "Jalebi", price: 100, category: 'sweet'),
];
