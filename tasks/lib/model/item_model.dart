class Model {
  final String? img;
  final String? itemName;
  final String? rating;
  final double? itemPrice;

  Model(
      {required this.img,
      required this.itemName,
      required this.itemPrice,
      this.rating});
}

List<Model> model = [
  Model(
      img: "assets/food1.png",
      itemName: "Veg Burger",
      itemPrice: 12.0,
      rating: "No.1 in Sales"),
  Model(
      img: "assets/food2.png",
      itemName: "Noodle",
      itemPrice: 10.0,
      rating: "High Rated"),
  Model(
      img: "assets/food3.png",
      itemName: "Margarita Pizza",
      itemPrice: 15.0,
      rating: "Best in Test"),
  Model(
      img: "assets/food4.png",
      itemName: "Veg Pizza",
      itemPrice: 13.0,
      rating: "Recommend"),
  Model(
      img: "assets/food5.png",
      itemName: "Green tea",
      itemPrice: 4.0,
      rating: "Recommend"),
  Model(
      img: "assets/food6.png",
      itemName: "Cold Coffee",
      itemPrice: 6.0,
      rating: "High Recommend"),
  Model(
      img: "assets/food7.png",
      itemName: "Ice Cream",
      itemPrice: 2.0,
      rating: "So Cold"),
  Model(
      img: "assets/food8.png",
      itemName: "Ice Candy",
      itemPrice: 2.0,
      rating: "So Cold"),
];
