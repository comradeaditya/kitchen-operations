import 'package:kitchen_operations/models/employee_model.dart';
import 'package:kitchen_operations/models/shift_model.dart';
import 'package:kitchen_operations/models/order_model.dart';
import 'package:kitchen_operations/models/shelf_item_model.dart';

class MockData {
  static List<EmployeeModel> employees = [
    EmployeeModel(
      name: 'Rajeev Singh', 
      role: 'Head Chef', 
      hoursPerShift: '3:45/8hour'
      ),
      EmployeeModel(
        name: 'Rahul K.', 
        role: 'Chef', 
        hoursPerShift: '3:45/8hour',
      ),
      EmployeeModel(
        name: 'Salman', 
        role: 'Assistant Chef', 
        hoursPerShift: '3:45/8hour'
      ),
      EmployeeModel(
        name: 'Priya Sharma', 
        role: 'Sous Chef', 
        hoursPerShift: '4:00/8hour'
      ),
      EmployeeModel(
        name: 'Amit Verma', 
        role: 'Line Cook', 
        hoursPerShift: '3:30/8hour',
      ),
  ];

  static List<ShiftModel> shifts = [
    ShiftModel(
      mealType: 'Breakfast',
      preparationTime: '8:00 AM - 9:00 AM',
      serveTime: '8:30 AM - 11:00 AM',
      eventName: null,
      employees: [
        EmployeeModel(name: 'Rajeev Singh', role: 'Head Chef', hoursPerShift: '3:45/8hour'),
        EmployeeModel(name: 'Rahul K.', role: 'Chef', hoursPerShift: '3:45/8hour'),
        EmployeeModel(name: 'Salman', role: 'Assistant Chef', hoursPerShift: '3:45/8hour'),
      ],
    ),
    ShiftModel(
      mealType: 'Lunch',
      preparationTime: '10:00 AM - 12:00 PM', 
      serveTime: '12:00 PM - 2:30 PM', 
      employees: [
        EmployeeModel(name: 'Priya Sharma', role: 'Sous Chef', hoursPerShift: '4:00/8hour'),
        EmployeeModel(name: 'Amit Verma', role: 'Line Cook', hoursPerShift: '3:30/8hour'),
        EmployeeModel(name: 'Rajeev Singh', role: 'Head Chef', hoursPerShift: '3:45/8hour'),
      ],
    ),
    ShiftModel(
      mealType: 'Dinner',
      preparationTime: '5:00 PM - 7:00 PM',
      serveTime: '7:00 PM - 9:30 PM',
      eventName: 'Event Name 2',
      employees: [
        EmployeeModel(name: 'Rahul K.', role: 'Chef', hoursPerShift: '3:45/8hour'),
        EmployeeModel(name: 'Salman', role: 'Assistant Chef', hoursPerShift: '3:45/8hour'),
        EmployeeModel(name: 'Amit Verma', role: 'Line Cook', hoursPerShift: '3:30/8hour'),
      ],
    ),
  ];

  static List<OrderModel> orders = [
    OrderModel(
      orderId: '10098',
      room: 'A-101',
      orderStatus: 'Preparing',
      timer: '29:38',
      items: [
        OrderItemModel(
          itemName: 'Butter Chicken', 
          quantity: '2 x 500g',
          assignedTo: 'Rahul K.'
        ),
        OrderItemModel(
          itemName: 'Butter Chicken', 
          quantity: '2 x 500g',
          assignedTo: 'Rahul K.'
        ),
        OrderItemModel(
          itemName: 'Butter Chicken', 
          quantity: '2 x 500g',
          assignedTo: null,
        ),
      ]
    ),
    OrderModel(
      orderId: '10099', 
      room: 'B-202', 
      orderStatus: 'Preparing', 
      timer: '15:20', 
      items: [
        OrderItemModel(
          itemName: 'Paneer Tikka', 
          quantity: '3 x 200g',
          assignedTo: 'Priya Sharma',
        ),
        OrderItemModel(
          itemName: 'Naan', 
          quantity: '5 x pieces',
          assignedTo: null,
        ),
      ],
    ),
    OrderModel(
      orderId: '10100', 
      room: 'C-303', 
      orderStatus: 'Preparing', 
      timer: '45:00', 
      items: [
        OrderItemModel(
          itemName: 'Mutton', 
          quantity: '1 x 300g',
          assignedTo: 'Amit Verma',
        ),
        OrderItemModel(
          itemName: 'Caesar Salad', 
          quantity: '2 x portions',
          assignedTo: 'Salman',
        ),
      ],
    ),
  ];

  static List<ShelfItemModel> shelfItems = [
    ShelfItemModel(
      itemId: 'IN01', 
      itemName: 'Tomato', 
      itemType: 'Vegetables', 
      preservationMethod: 'Refrigerator', 
      storageLocation: 'Location 1', 
      totalQuantity: '8 kg', 
      daysLeft: 2, 
      availableQuantity: '2 kg'
    ),
    ShelfItemModel(
      itemId: 'IN01',
      itemName: 'Cheese',
      itemType: 'Dairy',
      preservationMethod: 'Deep Freeze',
      storageLocation: 'Location 2',
      totalQuantity: '5 kg',
      daysLeft: 3,
      availableQuantity: '3 kg',
    ),
    ShelfItemModel(
      itemId: 'IN01', 
      itemName: 'Rice', 
      itemType: 'Grocery', 
      preservationMethod: 'Dry', 
      storageLocation: 'Location 1', 
      totalQuantity: '20 kg', 
      daysLeft: 5, 
      availableQuantity: '5 kg'
    ),
    ShelfItemModel(
      itemId: 'IN01', 
      itemName: 'Mutton', 
      itemType: 'Meat', 
      preservationMethod: 'Refigerator', 
      storageLocation: 'Location 2', 
      totalQuantity: '8 kg', 
      daysLeft: 6, 
      availableQuantity: '7 kg',
    ),
    ShelfItemModel(
      itemId: 'IN01', 
      itemName: 'Paneer Tikka', 
      itemType: 'Dairy', 
      preservationMethod: 'Refrigerator', 
      storageLocation: 'Location 1', 
      totalQuantity: '8 kg', 
      daysLeft: 1, 
      availableQuantity: '4 kg',
    ),
  ];
}