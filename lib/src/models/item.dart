import 'package:home_restaurant/src/models/extras.dart';
import 'allergens.dart';
import 'media.dart';

class Item {
  String id;
  String name;
  String? description;
  int price; // in cents
  String? categoryId;
  bool available;
  List<String>? tags;
  DateTime created;
  List<Media>? images;
  List<Allergens>? allergens;
  Map<String, ExtraGroup>? extraGroups;
  Map<String, ItemTranslation>? translations;

  Item({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.categoryId,
    required this.available,
    this.tags,
    required this.created,
    this.images,
    this.allergens,
    this.extraGroups,
    this.translations,
  });

  factory Item.fromMap(Map<String, dynamic> json) {
    try {
      return Item(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        categoryId: json['categoryId'],
        available: json['available'],
        tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
        created: json['created'].toDate(),
        images: json['images'] != null
            ? List<Media>.from(json['images'].map((x) => Media.fromMap(x)))
            : null,
        allergens: json['allergens'] != null
            ? List<Allergens>.from(
                json['allergens'].map((x) => Allergens.fromMap(x)))
            : null,
        extraGroups: json['extraGroups'] != null
            ? Map<String, ExtraGroup>.from(json['extraGroups']
                .map((key, value) => MapEntry(key, ExtraGroup.fromMap(value))))
            : null,
        translations: json['translations'] != null
            ? Map<String, ItemTranslation>.from(json['translations'].map(
                (key, value) => MapEntry(key, ItemTranslation.fromMap(value))))
            : null,
      );
    } catch (e) {
      print('item: ${e}');
      throw e;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'categoryId': categoryId,
      'available': available,
      'tags': tags,
      'created': created.toIso8601String(),
      'images': images != null ? images!.map((x) => x.toMap()).toList() : null,
      'allergens':
          allergens != null ? allergens!.map((x) => x.toMap()).toList() : null,
      'extraGroups': extraGroups != null
          ? extraGroups!.map((key, value) => MapEntry(key, value.toMap()))
          : null,
      'translations': translations != null
          ? translations!.map((key, value) => MapEntry(key, value.toMap()))
          : null,
    };
  }
}

class ItemTranslation {
  String? name;
  String? description;
  List<String>? tags;
  ItemTranslation({
    this.description,
    this.name,
    this.tags,
  });

  factory ItemTranslation.fromMap(Map<String, dynamic> json) {
    return ItemTranslation(
      name: json['name'],
      description: json['description'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'tags': tags,
    };
  }
}
