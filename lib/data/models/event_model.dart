import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:split_it/data/models/base_model.dart';

import 'friend_model.dart';
import 'item_model.dart';

class EventModel extends BaseModel {
  final String name;
  final String id;
  final DateTime? created;
  final double value;
  final double valuePaid;
  final List<ItemModel> itensList;
  final List<FriendModel> friendsList;

  EventModel({
    this.name = '',
    this.id = '',
    this.created,
    this.value = 0,
    this.valuePaid = 0,
    this.itensList = const [],
    this.friendsList = const [],
  }) : super(collection: '/events');

  int get people => friendsList.length;
  double get splitValue => (calcValue / friendsList.length);
  double get remainingValue => value - valuePaid;
  double get calcValue => itensList.isNotEmpty
      ? itensList
          .reduce(
            (value, element) =>
                value = value.copyWith(value: value.value + element.value),
          )
          .value
      : 0;

  EventModel copyWith({
    String? name,
    String? id,
    DateTime? created,
    double? value,
    double? valuePaid,
    List<ItemModel>? itensList,
    List<FriendModel>? friendsList,
  }) {
    return EventModel(
      name: name ?? this.name,
      id: id ?? this.name,
      created: created ?? this.created,
      value: value == 0 ? calcValue : this.value,
      valuePaid: valuePaid ?? this.valuePaid,
      itensList: itensList ?? this.itensList,
      friendsList: friendsList ?? this.friendsList,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'title': name,
      'id': id,
      //utiliza a hora do servidor do firebase
      'created': FieldValue.serverTimestamp(),
      'value': calcValue,
      'valuePaid': valuePaid,
      'itensList': itensList.map((x) => x.toMap()).toList(),
      'friendsList': friendsList.map((x) => x.toMap()).toList(),
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      name: map['title'],
      id: map['id'],
      created: map['created'] != null
          ? (map['created'] as Timestamp).toDate()
          : null,
      value: map['value']?.toDouble(),
      valuePaid: map['valuePaid']?.toDouble() ?? 0,
      itensList: List<ItemModel>.from(
          map['itensList']?.map((x) => ItemModel.fromMap(x))),
      friendsList: List<FriendModel>.from(
          map['friendsList']?.map((x) => FriendModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventModel(title: $name, created: $created, value: $value, itensList: $itensList, friendsList: $friendsList)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.name == name &&
        other.id == id &&
        other.created == created &&
        other.value == value &&
        listEquals(other.itensList, itensList) &&
        listEquals(other.friendsList, friendsList);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        created.hashCode ^
        value.hashCode ^
        itensList.hashCode ^
        friendsList.hashCode;
  }
}
