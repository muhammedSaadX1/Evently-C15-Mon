import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c15_mon/models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel {

  String  id;
  String userId;
  CategoryModel category;
  String title;
  String description;
  DateTime dateTime;


  EventModel(
      { this.id = '', required this.category, required this.title, required this.description, required this.dateTime, required this.userId});

  EventModel.fromJson(Map<String, dynamic> json) : this(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      description: json["description"],
      dateTime: json["dateTime"].toDate(),
      category: CategoryModel.categoriesWithAll.firstWhere((
          category) => category.id == json["categoryId"]));

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "userId": userId,
        "categoryId": category.id,
        "title": title,
        "description": description,
        "dateTime": Timestamp.fromDate(dateTime)
      };
}