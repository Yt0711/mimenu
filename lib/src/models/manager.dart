import 'package:cloud_firestore/cloud_firestore.dart';

class Manager {
  final DocumentReference? reference;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? photoUrl;
  final List<String>? restaurants;

  Manager({
    this.reference,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.photoUrl,
    this.restaurants,
  });

  factory Manager.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Manager(
      reference: snapshot.reference,
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      address: data['address'],
      photoUrl: data['photoUrl'],
      restaurants: data['restaurants'] != null
          ? List<String>.from(data['restaurants'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'photoUrl': photoUrl,
        'restaurants': restaurants,
      };

  Manager copyWith({
    DocumentReference? reference,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? photoUrl,
    List<String>? restaurants,
  }) {
    return Manager(
      reference: reference ?? this.reference,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      photoUrl: photoUrl ?? this.photoUrl,
      restaurants: restaurants ?? this.restaurants,
    );
  }
}
