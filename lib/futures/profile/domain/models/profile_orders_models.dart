class OrderModel {
  String? id, orderNumber, trackingNumber, totalAmount, status;

  String? date, address, paymentMethod, deliveryMethod, discount;

  List<String>? items;

  int? quantity;

  OrderModel(
      {this.id,
      this.orderNumber,
      this.trackingNumber,
      this.quantity,
      this.totalAmount,
      this.status,
      this.date,
      this.items,
      this.address,
      this.paymentMethod,
      this.deliveryMethod,
      this.discount});

  OrderModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        orderNumber = json['order_number'],
        trackingNumber = json['tracking_number'],
        quantity = json['quantity'],
        totalAmount = json['total_amount'],
        status = json['status'],
        date = json['date'],
        items = json['items'].cast<String>(),
        address = json['address'],
        paymentMethod = json['payment_method'],
        deliveryMethod = json['delivery_method'],
        discount = json['discount'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'order_number': orderNumber,
        'tracking_number': trackingNumber,
        'quantity': quantity,
        'total_amount': totalAmount,
        'status': status,
        'date': date,
        'items': items,
        'address': address,
        'payment_method': paymentMethod,
        'delivery_method': deliveryMethod,
        'discount': discount,
      };
}
