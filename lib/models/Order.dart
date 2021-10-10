class OrderProduct {
  int productId;
  String size;
  String color;
  int colorCode;
  String productName;
  int qty;
  double price;
  String image;

  OrderProduct(
      {required this.productId,
      required this.size,
      required this.color,
      required this.productName,
      required this.qty,
      required this.price,
      required this.colorCode,
      required this.image});
}

class Order {
  late String fname;
  late String lname;
  late String mobile;
  late String city;
  late String district;
  late String address;
  late double total;
  late String deliveryType;
  late double deliveryCharge;
  late String paymentType;
  late List<OrderProduct> products;

  Order();

  static Order order = new Order();

  static Order getOrder() {
    return order;
  }

  static setOrder(Order value) {
    order = value;
  }
}
