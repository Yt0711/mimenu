import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_restaurant/src/models/extras.dart';
import 'package:home_restaurant/src/models/item.dart';
import 'package:home_restaurant/src/models/payment.dart';

enum OrderStatus {
  pending,
  accepted,
  preparing,
  ready,
  completed,
  unknown,
  cancelled;

  String toJson() => name;
  static OrderStatus fromdata(String? data) => values.byName(data ?? 'unknown');
}

class Order {
  final DocumentReference? reference;
  String? id;
  String? restaurantId;
  String? tableId;
  String? customerId;
  List<OrderItem>? items;
  int total; // in cents
  String? notes;
  OrderStatus status;
  DateTime created;
  List<Payment>? payments;

  Order({
    this.reference,
    this.id,
    this.restaurantId,
    this.tableId,
    this.customerId,
    this.items,
    required this.total,
    this.notes,
    required this.status,
    required this.created,
    this.payments,
  });

  factory Order.fromSnapshot(DocumentSnapshot json) {
    final data = json.data() as Map<String, dynamic>;
    return Order(
      reference: json.reference,
      id: data['id'],
      restaurantId: data['restaurantId'],
      tableId: data['tableId'],
      customerId: data['customerId'],
      items: data['items'] != null
          ? List<OrderItem>.from(data['items'].map((x) => OrderItem.fromMap(x)))
          : null,
      total: data['total'],
      notes: data['notes'],
      status: OrderStatus.fromdata(data['status']),
      created: data['created'].toDate(),
      payments: data['payments'] != null
          ? List<Payment>.from(data['payments'].map((x) => Payment.fromMap(x)))
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'restaurantId': restaurantId,
      'tableId': tableId,
      'customerId': customerId,
      'items': items != null ? items!.map((item) => item.toMap()).toList() : [],
      'total': total,
      'notes': notes,
      'status': status.toJson(),
      'created': created,
      'payments': payments != null
          ? payments!.map((item) => item.toMap()).toList()
          : [],
    };
  }

  Order copyWith({
    DocumentReference? reference,
    String? id,
    String? restaurantId,
    String? tableId,
    String? customerId,
    List<OrderItem>? items,
    int? total,
    String? notes,
    OrderStatus? status,
    DateTime? created,
    List<Payment>? payments,
  }) {
    return Order(
      reference: reference ?? this.reference,
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      tableId: tableId ?? this.tableId,
      customerId: customerId ?? this.customerId,
      items: items ?? this.items,
      total: total ?? this.total,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      created: created ?? this.created,
      payments: payments ?? this.payments,
    );
  }

  Future<void>? save() {
    return reference?.set(toMap());
  }
}

class OrderItem {
  Item item;
  int quantity;
  Map<String, ExtraOption>? extras;
  int price; // Price for this item, including selected extras

  OrderItem({
    required this.item,
    required this.quantity,
    this.extras,
    required this.price,
  });

  factory OrderItem.fromMap(Map<String, dynamic> json) {
    return OrderItem(
      item: Item.fromMap(json['item']),
      quantity: json['quantity'],
      extras: json['extras'] != null
          ? Map<String, ExtraOption>.from(json['extras']
              .map((key, value) => MapEntry(key, ExtraOption.fromMap(value))))
          : null,
      price: json['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'item': item.toMap(),
      'quantity': quantity,
      'extras': extras != null
          ? extras!.map((key, value) => MapEntry(key, value.toMap()))
          : null,
      'price': price,
    };
  }

  OrderItem copyWith({
    Item? item,
    int? quantity,
    Map<String, ExtraOption>? extras,
    int? price,
  }) {
    return OrderItem(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
      extras: extras ?? this.extras,
      price: price ?? this.price,
    );
  }

  int get total => price * quantity;
}

class SimplifiedOrder {
  List<OrderItem> items;
  String? notes;
  OrderStatus status;
  DateTime created;

  SimplifiedOrder({
    required this.items,
    this.notes,
    required this.status,
    required this.created,
  });

  factory SimplifiedOrder.fromMap(Map<String, dynamic> json) {
    return SimplifiedOrder(
      items:
          List<OrderItem>.from(json['items'].map((x) => OrderItem.fromMap(x))),
      notes: json['notes'],
      status: OrderStatus.fromdata(json['status']),
      created: json['created'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'items': items.map((item) => item.toMap()).toList(),
      'notes': notes,
      'status': status.toJson(),
      'created': created,
    };
  }

  SimplifiedOrder copyWith({
    List<OrderItem>? items,
    String? notes,
    OrderStatus? status,
    DateTime? created,
  }) {
    return SimplifiedOrder(
      items: items ?? this.items,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      created: created ?? this.created,
    );
  }
}

class OrderTable {
  final DocumentReference reference;
  List<OrderItem> cart;
  int? guests;
  List<SimplifiedOrder> orders;
  Order? finalOrder;

  OrderTable({
    required this.reference,
    required this.cart,
    this.guests,
    required this.orders,
    this.finalOrder,
  });

  factory OrderTable.fromSnapshot(DocumentSnapshot json) {
    final data = json.data() as Map<String, dynamic>;
    return OrderTable(
      reference: json.reference,
      cart: List<OrderItem>.from(data['cart'].map((x) => OrderItem.fromMap(x))),
      guests: data['guests'],
      orders: List<SimplifiedOrder>.from(
          data['orders'].map((x) => SimplifiedOrder.fromMap(x))),
      finalOrder: data['finalOrder'] != null
          ? Order.fromSnapshot(data['finalOrder'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cart': cart.map((item) => item.toMap()).toList(),
      'guests': guests,
      'orders': orders.map((order) => order.toMap()).toList(),
      'finalOrder': finalOrder != null ? finalOrder!.toMap() : null,
    };
  }
}
