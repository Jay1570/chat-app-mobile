// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_read_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReadStatus {

 String get userId; String? get lastReadAt;
/// Create a copy of ReadStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadStatusCopyWith<ReadStatus> get copyWith => _$ReadStatusCopyWithImpl<ReadStatus>(this as ReadStatus, _$identity);

  /// Serializes this ReadStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadStatus&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,lastReadAt);

@override
String toString() {
  return 'ReadStatus(userId: $userId, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class $ReadStatusCopyWith<$Res>  {
  factory $ReadStatusCopyWith(ReadStatus value, $Res Function(ReadStatus) _then) = _$ReadStatusCopyWithImpl;
@useResult
$Res call({
 String userId, String? lastReadAt
});




}
/// @nodoc
class _$ReadStatusCopyWithImpl<$Res>
    implements $ReadStatusCopyWith<$Res> {
  _$ReadStatusCopyWithImpl(this._self, this._then);

  final ReadStatus _self;
  final $Res Function(ReadStatus) _then;

/// Create a copy of ReadStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? lastReadAt = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,lastReadAt: freezed == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReadStatus].
extension ReadStatusPatterns on ReadStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadStatus value)  $default,){
final _that = this;
switch (_that) {
case _ReadStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadStatus value)?  $default,){
final _that = this;
switch (_that) {
case _ReadStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String? lastReadAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadStatus() when $default != null:
return $default(_that.userId,_that.lastReadAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String? lastReadAt)  $default,) {final _that = this;
switch (_that) {
case _ReadStatus():
return $default(_that.userId,_that.lastReadAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String? lastReadAt)?  $default,) {final _that = this;
switch (_that) {
case _ReadStatus() when $default != null:
return $default(_that.userId,_that.lastReadAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReadStatus implements ReadStatus {
  const _ReadStatus({required this.userId, this.lastReadAt});
  factory _ReadStatus.fromJson(Map<String, dynamic> json) => _$ReadStatusFromJson(json);

@override final  String userId;
@override final  String? lastReadAt;

/// Create a copy of ReadStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadStatusCopyWith<_ReadStatus> get copyWith => __$ReadStatusCopyWithImpl<_ReadStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadStatus&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,lastReadAt);

@override
String toString() {
  return 'ReadStatus(userId: $userId, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class _$ReadStatusCopyWith<$Res> implements $ReadStatusCopyWith<$Res> {
  factory _$ReadStatusCopyWith(_ReadStatus value, $Res Function(_ReadStatus) _then) = __$ReadStatusCopyWithImpl;
@override @useResult
$Res call({
 String userId, String? lastReadAt
});




}
/// @nodoc
class __$ReadStatusCopyWithImpl<$Res>
    implements _$ReadStatusCopyWith<$Res> {
  __$ReadStatusCopyWithImpl(this._self, this._then);

  final _ReadStatus _self;
  final $Res Function(_ReadStatus) _then;

/// Create a copy of ReadStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? lastReadAt = freezed,}) {
  return _then(_ReadStatus(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,lastReadAt: freezed == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
