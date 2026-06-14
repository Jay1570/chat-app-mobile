import "package:json_annotation/json_annotation.dart";

part "user.g.dart";

@JsonSerializable()
class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String email;
  final String? imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
