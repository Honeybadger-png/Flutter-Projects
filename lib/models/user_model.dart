import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  final String? apiSearch;
  final List<String>? diet;
  final List<String>? health;
  final List<String>? cuisineType;
  final List<String>? favoriFood;

  const UserModel(
      {this.id,
      this.diet,
      this.health,
      this.cuisineType,
      this.favoriFood,
        this.apiSearch,
      required this.email,
      required this.fullName,
      required this.phoneNo,
      required this.password});

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
      "diet": diet,
      "health": health,
      "cuisineType": cuisineType,
      "favoriFood": favoriFood,
      "apiSearch": apiSearch,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["Email"],
      fullName: data["FullName"],
      phoneNo: data["Phone"],
      password: data["Password"],
      apiSearch: data["apiSearch"],
      diet: data["diet"] == null? []: List<String>.from(data["diet"].map((x)=> x)),
      health: data["health"]== null? []: List<String>.from(data["diet"].map((x)=> x)),
      cuisineType: data["cuisineType"]== null? []: List<String>.from(data["diet"].map((x)=> x)),
      favoriFood: data["favoriFood"] ==  null? []: List<String>.from(data["diet"].map((x)=> x))
    );
  }
}
