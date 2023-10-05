import 'package:cloud_firestore/cloud_firestore.dart';

import 'menuMedia.dart';

class Restaurant {
  final DocumentReference id;
  String name;
  String? description;
  String? phone;
  String? email;
  String? address;
  String? category;
  DateTime? created;
  List<MenuMedia>? images;

  Restaurant({
    required this.id,
    required this.name,
    this.description,
    this.phone,
    this.email,
    this.address,
    this.category,
    this.created,
    this.images,
  });
}
