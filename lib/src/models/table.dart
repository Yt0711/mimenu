enum TableStatus {
  available,
  reserved,
  occupied,
  unknown,
  unavailable;

  String toJson() => name;
  static TableStatus fromJson(String? json) => values.byName(json ?? 'unknown');
}

class RestaurantTable {
  String? id;
  int? number;
  int? seats;
  TableStatus? status;
  Zone? zone;

  RestaurantTable({
    required this.id,
    required this.number,
    required this.seats,
    required this.status,
    this.zone,
  });

  factory RestaurantTable.fromMap(Map<String, dynamic> json) {
    try {
      return RestaurantTable(
        id: json['id'],
        number: json['number'],
        seats: json['seats'],
        status: TableStatus.fromJson(json['status']),
        zone: json['zone'] != null ? Zone.fromMap(json['zone']) : null,
      );
    } catch (e) {
      print('Error parsing Table: $e');
      rethrow;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'seats': seats,
      'status': status?.toJson(),
      'zone': zone?.toMap(),
    };
  }
}

class Zone {
  String id;
  String name;

  Zone({required this.id, required this.name});

  factory Zone.fromMap(Map<String, dynamic> json) {
    return Zone(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
