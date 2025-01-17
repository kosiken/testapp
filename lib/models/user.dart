import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';


part 'user.g.dart';

@JsonSerializable()
@immutable
class User {
  final String id;
  final String name;
  final String email;
  final int age;

  const User({required this.id, required this.name, required this.email, required this.age});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}