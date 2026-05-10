class OrderItemModel {
  final String itemName;
  final String quantity;
  final String? assignedTo;

  OrderItemModel({
    required this.itemName,
    required this.quantity,
    this.assignedTo,
  });
}

class OrderModel {
  final String orderId;
  final String room;
  final String orderStatus;
  final String timer;
  final List<OrderItemModel> items;

  OrderModel({
    required this.orderId,
    required this.room, 
    required this.orderStatus,
    required this.timer,
    required this.items,
  });
}