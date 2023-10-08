import 'package:home_restaurant/src/models/allergens.dart';

class ExtraGroup {
  bool available;
  String name;
  String description;
  bool allowMultiple;
  bool isRequired;
  List<ExtraOption> options;
  Map<String, ExtraGroupTranstalion>? translations;

  ExtraGroup({
    this.available = true,
    required this.name,
    this.description = '',
    this.allowMultiple = false,
    this.isRequired = false,
    this.options = const [],
    this.translations,
  });

  factory ExtraGroup.fromMap(Map<String, dynamic> json) {
    try {
      return ExtraGroup(
        available: json['available'],
        name: json['name'],
        description: json['description'],
        allowMultiple: json['allowMultiple'],
        isRequired: json['isRequired'],
        options: json['options'] != null
            ? List<ExtraOption>.from(
                json['options'].map((x) => ExtraOption.fromMap(x)))
            : [],
        translations: json['translations'] != null
            ? Map<String, ExtraGroupTranstalion>.from(json['translations'].map(
                (key, value) =>
                    MapEntry(key, ExtraGroupTranstalion.fromMap(value))))
            : null,
      );
    } catch (e) {
      print('Error parsing ExtraGroup: $e');
      rethrow;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'name': name,
      'description': description,
      'allowMultiple': allowMultiple,
      'isRequired': isRequired,
      'options': options.map((option) => option.toMap()).toList(),
      'translations': translations != null
          ? translations!.map((key, value) => MapEntry(key, value.toMap()))
          : null,
    };
  }
}

class ExtraGroupTranstalion {
  String name;
  String description;

  ExtraGroupTranstalion({
    required this.name,
    this.description = '',
  });

  factory ExtraGroupTranstalion.fromMap(Map<String, dynamic> json) {
    return ExtraGroupTranstalion(
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
    };
  }
}

class ExtraOption {
  String name;
  int price; // cents
  String description;
  bool available;
  bool? isDefault;
  List<Allergens>? allergens;

  Map<String, ExtraOptionTranstalion>? translations;

  ExtraOption({
    this.available = true,
    required this.name,
    this.description = '',
    this.price = 0,
    this.translations,
  });

  factory ExtraOption.fromMap(Map<String, dynamic> json) {
    try {
      return ExtraOption(
        available: json['available'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        translations: json['translations'] != null
            ? Map<String, ExtraOptionTranstalion>.from(json['translations'].map(
                (key, value) =>
                    MapEntry(key, ExtraOptionTranstalion.fromMap(value))))
            : null,
      );
    } catch (e) {
      print('Error parsing ExtraOption: $e');
      rethrow;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'name': name,
      'description': description,
      'price': price,
      'translations': translations != null
          ? translations!.map((key, value) => MapEntry(key, value.toMap()))
          : null,
    };
  }
}

class ExtraOptionTranstalion {
  String name;
  String description;

  ExtraOptionTranstalion({
    required this.name,
    this.description = '',
  });

  factory ExtraOptionTranstalion.fromMap(Map<String, dynamic> json) {
    return ExtraOptionTranstalion(
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
    };
  }
}
