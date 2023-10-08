import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_restaurant/src/models/media.dart';
import 'package:home_restaurant/src/models/table.dart';
import 'category.dart';
import 'item.dart';

class Language {
  String name;
  String code;

  Language({
    required this.name,
    required this.code,
  });

  factory Language.fromMap(Map<String, dynamic> json) {
    return Language(
      name: json['name'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
    };
  }
}

class Restaurant {
  final DocumentReference? reference;
  String? id;
  String name;
  String? address;
  String? logo;
  List<String>? tags;
  String? description;
  String? phone;
  String? email;
  String? web;
  DateTime? created;
  String? observations;
  List<Category>? categories;
  List<Item>? items;
  List<RestaurantTable>? tables;
  List<Media>? images;
  List<Language>? availableLanguages;
  Map<String, RestaurantTranslation>? translations;
  List<String>? managers;
  List<Zone>? zones;

  Restaurant({
    this.reference,
    this.id,
    required this.name,
    this.address,
    this.logo,
    this.tags,
    this.description,
    this.phone,
    this.email,
    this.web,
    this.created,
    this.observations,
    this.categories,
    this.items,
    this.tables,
    this.images,
    this.availableLanguages,
    this.translations,
    this.managers,
    this.zones,
  });

  factory Restaurant.fromSnapshot(DocumentSnapshot json) {
    final data = json.data() as Map<String, dynamic>;
    try {
      return Restaurant(
        reference: json.reference,
        id: data['id'],
        name: data['name'],
        address: data['address'],
        logo: data['logo'],
        tags: data['tags'] != null ? List<String>.from(data['tags']) : null,
        description: data['description'],
        phone: data['phone'],
        email: data['email'],
        web: data['web'],
        created: data['created']?.toDate(),
        observations: data['observations'],
        categories: data['categories'] != null
            ? List<Category>.from(
                data['categories'].map((x) => Category.fromMap(x)))
            : null,
        items: data['items'] != null
            ? List<Item>.from(data['items'].map((x) => Item.fromMap(x)))
            : null,
        tables: data['tables'] != null
            ? List<RestaurantTable>.from(
                data['tables'].map((x) => RestaurantTable.fromMap(x)))
            : null,
        images: data['images'] != null
            ? List<Media>.from(data['images'].map((x) => Media.fromMap(x)))
            : null,
        availableLanguages: data['availableLanguages'] != null
            ? List<Language>.from(
                data['availableLanguages'].map((x) => Language.fromMap(x)))
            : [],
        translations: data['translations'] != null
            ? Map<String, RestaurantTranslation>.from(data['translations'].map(
                (key, value) =>
                    MapEntry(key, RestaurantTranslation.fromMap(value))))
            : null,
        managers: data['managers'] != null
            ? List<String>.from(data['managers'])
            : null,
        zones: data['zones'] != null
            ? List<Zone>.from(data['zones'].map((x) => Zone.fromMap(x)))
            : null,
      );
    } catch (e) {
      print('Error parsing Restaurant: $e');
      rethrow;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'logo': logo,
      'tags': tags,
      'description': description,
      'phone': phone,
      'email': email,
      'web': web,
      'created': created,
      'observations': observations,
      'categories': categories != null
          ? categories!.map((category) => category.toMap()).toList()
          : null,
      'items':
          items != null ? items!.map((item) => item.toMap()).toList() : null,
      'tables': tables != null
          ? tables!.map((table) => table.toMap()).toList()
          : null,
      'images': images != null
          ? images!.map((image) => image.toMap()).toList()
          : null,
      'availableLanguages':
          availableLanguages?.map((language) => language.toMap()).toList(),
      'translations': translations != null
          ? translations!.map((key, value) => MapEntry(key, value.toMap()))
          : null,
      'managers': managers,
      'zones': zones?.map((zone) => zone.toMap()).toList(),
    };
  }

  Future<void>? save() {
    return reference?.set(toMap(), SetOptions(merge: true));
  }
}

class RestaurantTranslation {
  String? description;
  String? tags;

  RestaurantTranslation({this.description, this.tags});

  factory RestaurantTranslation.fromMap(Map<String, dynamic> json) {
    return RestaurantTranslation(
      description: json['description'],
      tags: json['tags'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'tags': tags,
    };
  }
}

class RestaurantInfo {
  String id;
  String name;
  String? address;
  String? logo;
  List<String>? tags;

  RestaurantInfo({
    required this.id,
    required this.name,
    this.address,
    this.logo,
    this.tags,
  });

  factory RestaurantInfo.fromMap(Map<String, dynamic> json) {
    return RestaurantInfo(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      logo: json['logo'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'logo': logo,
      'tags': tags,
    };
  }
}
