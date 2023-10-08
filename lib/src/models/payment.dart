enum PaymentMethod {
  cash,
  card,
  paypal,
  stripe,
  unknown;

  String toJson() => name;
  static PaymentMethod fromJson(String? json) =>
      values.byName(json ?? 'unknown');
}

enum PaymentStatus {
  pending,
  paid,
  refunded,
  failed,
  unknown;

  String toJson() => name;
  static PaymentStatus fromJson(String? json) =>
      values.byName(json ?? 'unknown');
}

class Payment {
  final String? id;
  final PaymentMethod method;
  final PaymentStatus status;
  final int amount; // in cents
  final DateTime created;

  Payment({
    this.id,
    required this.method,
    required this.status,
    required this.amount,
    required this.created,
  });

  factory Payment.fromMap(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      method: PaymentMethod.fromJson(json['method']),
      status: PaymentStatus.fromJson(json['status']),
      amount: json['amount'],
      created: json['created'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'method': method.toJson(),
      'status': status.toJson(),
      'amount': amount,
      'created': created.toIso8601String(),
    };
  }
}
