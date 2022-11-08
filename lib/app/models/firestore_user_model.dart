import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserModel {
  final String name;
  final String age;
  final String phoneNumber;
  final String department;
  final String profilePic;

  FirestoreUserModel({
    required this.name,
    required this.age,
    required this.phoneNumber,
    required this.department,
    required this.profilePic,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'phone_number': phoneNumber,
      'department': department,
      'profile_pic': profilePic,
    };
  }

  factory FirestoreUserModel.fromDocument(DocumentSnapshot documentSnapshot) =>
      FirestoreUserModel(
        name: documentSnapshot.get('name'),
        age: documentSnapshot.get('age'),
        phoneNumber: documentSnapshot.get('phone_number'),
        department: documentSnapshot.get('department'),
        profilePic: documentSnapshot.get('profile_pic'),
      );

  factory FirestoreUserModel.fromJson(Map<String, dynamic> json) =>
      FirestoreUserModel(
        name: json['name'],
        age: json['age'],
        phoneNumber: json['phone_number'],
        department: json['department'],
        profilePic: json['profile_pic'],
      );
}
