import 'package:cloud_firestore/cloud_firestore.dart';

import 'menuMedia.dart';

class Item {
  DocumentReference? id;
  bool? available;
  String? allergens;
  DocumentReference? categoryId;
  DateTime? created;
  String? description;
  List<MenuMedia>? itemImages;
  List<String>? tags;

  Item({
    required this.id,
    this.allergens,
    this.available,
    this.categoryId,
    this.created,
    this.description,
    this.itemImages,
    this.tags,
  });
}
