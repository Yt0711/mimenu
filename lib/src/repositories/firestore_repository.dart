import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_restaurant/src/models/manager.dart';
import 'package:home_restaurant/src/models/order.dart';
import 'package:home_restaurant/src/models/restaurant.dart';

abstract class DatabaseRepository {
  Future<Manager> getManager(String id);
  Future<Restaurant> getRestaurant(String id);
  Future<List<Restaurant>> getRestaurantByManager(String id);
  Future<OrderTable> getOrderTable(String restaurantID, String tableID);
}

class FireStoreRepository implements DatabaseRepository {
  final FirebaseFirestore instance;

  FireStoreRepository(FirebaseFirestore? instance)
      : instance = instance ?? FirebaseFirestore.instance;

  @override
  Future<Manager> getManager(String id) {
    final CollectionReference ref = instance.collection('managers');
    return ref.doc(id).get().then((value) => Manager.fromSnapshot(value));
  }

  @override
  Future<Restaurant> getRestaurant(String id) async {
    final CollectionReference ref = instance.collection('restaurants');
    final data = await ref.doc(id).get();
    return Restaurant.fromSnapshot(data);
  }

  @override
  Future<List<Restaurant>> getRestaurantByManager(String id) {
    final CollectionReference ref = instance.collection('restaurants');
    return ref.where('managers', arrayContains: id).get().then((value) {
      final data = value.docs;
      return data.map((e) => Restaurant.fromSnapshot(e)).toList();
    });
  }

  @override
  Future<OrderTable> getOrderTable(String restaurantID, String tableID) async {
    print(restaurantID);
    final CollectionReference ref = instance
        .collection('restaurants')
        .doc(restaurantID)
        .collection('tables');
    final data = await ref.doc(tableID).get();

    return OrderTable.fromSnapshot(data);
  }
}
