class ShelfItemModel {
  final String itemId;
  final String itemName;
  final String itemType;
  final String preservationMethod;
  final String storageLocation;
  final String totalQuantity;
  final int daysLeft;
  final String availableQuantity;

  ShelfItemModel({
    required this.itemId,
    required this.itemName,
    required this.itemType,
    required this.preservationMethod,
    required this.storageLocation,
    required this.totalQuantity,
    required this.daysLeft,
    required this.availableQuantity,
  });
}
