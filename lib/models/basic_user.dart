import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_user.freezed.dart';
part 'basic_user.g.dart';

@freezed
abstract class BasicUser with _$BasicUser {
  const factory BasicUser({
    required String id,
    required String name,
    String? imageUrl,
  }) = _BasicUser;

  factory BasicUser.fromJson(Map<String, dynamic> json) =>
      _$BasicUserFromJson(json);
}
