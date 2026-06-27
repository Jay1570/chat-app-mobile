// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Conversation {

 String get id; String get name; String get type; String? get lastMessage; String? get lastMessageByUserId; BasicUser? get lastMessageByUser; String? get lastMessageAt; int get unreadCount; List<BasicUser> get otherUsers;
/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationCopyWith<Conversation> get copyWith => _$ConversationCopyWithImpl<Conversation>(this as Conversation, _$identity);

  /// Serializes this Conversation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conversation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageByUserId, lastMessageByUserId) || other.lastMessageByUserId == lastMessageByUserId)&&(identical(other.lastMessageByUser, lastMessageByUser) || other.lastMessageByUser == lastMessageByUser)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&const DeepCollectionEquality().equals(other.otherUsers, otherUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,lastMessage,lastMessageByUserId,lastMessageByUser,lastMessageAt,unreadCount,const DeepCollectionEquality().hash(otherUsers));

@override
String toString() {
  return 'Conversation(id: $id, name: $name, type: $type, lastMessage: $lastMessage, lastMessageByUserId: $lastMessageByUserId, lastMessageByUser: $lastMessageByUser, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount, otherUsers: $otherUsers)';
}


}

/// @nodoc
abstract mixin class $ConversationCopyWith<$Res>  {
  factory $ConversationCopyWith(Conversation value, $Res Function(Conversation) _then) = _$ConversationCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, String? lastMessage, String? lastMessageByUserId, BasicUser? lastMessageByUser, String? lastMessageAt, int unreadCount, List<BasicUser> otherUsers
});


$BasicUserCopyWith<$Res>? get lastMessageByUser;

}
/// @nodoc
class _$ConversationCopyWithImpl<$Res>
    implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._self, this._then);

  final Conversation _self;
  final $Res Function(Conversation) _then;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? lastMessage = freezed,Object? lastMessageByUserId = freezed,Object? lastMessageByUser = freezed,Object? lastMessageAt = freezed,Object? unreadCount = null,Object? otherUsers = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,lastMessageByUserId: freezed == lastMessageByUserId ? _self.lastMessageByUserId : lastMessageByUserId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageByUser: freezed == lastMessageByUser ? _self.lastMessageByUser : lastMessageByUser // ignore: cast_nullable_to_non_nullable
as BasicUser?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as String?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,otherUsers: null == otherUsers ? _self.otherUsers : otherUsers // ignore: cast_nullable_to_non_nullable
as List<BasicUser>,
  ));
}
/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasicUserCopyWith<$Res>? get lastMessageByUser {
    if (_self.lastMessageByUser == null) {
    return null;
  }

  return $BasicUserCopyWith<$Res>(_self.lastMessageByUser!, (value) {
    return _then(_self.copyWith(lastMessageByUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [Conversation].
extension ConversationPatterns on Conversation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Conversation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Conversation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Conversation value)  $default,){
final _that = this;
switch (_that) {
case _Conversation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Conversation value)?  $default,){
final _that = this;
switch (_that) {
case _Conversation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  String? lastMessage,  String? lastMessageByUserId,  BasicUser? lastMessageByUser,  String? lastMessageAt,  int unreadCount,  List<BasicUser> otherUsers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.lastMessage,_that.lastMessageByUserId,_that.lastMessageByUser,_that.lastMessageAt,_that.unreadCount,_that.otherUsers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  String? lastMessage,  String? lastMessageByUserId,  BasicUser? lastMessageByUser,  String? lastMessageAt,  int unreadCount,  List<BasicUser> otherUsers)  $default,) {final _that = this;
switch (_that) {
case _Conversation():
return $default(_that.id,_that.name,_that.type,_that.lastMessage,_that.lastMessageByUserId,_that.lastMessageByUser,_that.lastMessageAt,_that.unreadCount,_that.otherUsers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  String? lastMessage,  String? lastMessageByUserId,  BasicUser? lastMessageByUser,  String? lastMessageAt,  int unreadCount,  List<BasicUser> otherUsers)?  $default,) {final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.lastMessage,_that.lastMessageByUserId,_that.lastMessageByUser,_that.lastMessageAt,_that.unreadCount,_that.otherUsers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Conversation implements Conversation {
  const _Conversation({required this.id, required this.name, required this.type, this.lastMessage, this.lastMessageByUserId, this.lastMessageByUser, this.lastMessageAt, required this.unreadCount, required final  List<BasicUser> otherUsers}): _otherUsers = otherUsers;
  factory _Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
@override final  String? lastMessage;
@override final  String? lastMessageByUserId;
@override final  BasicUser? lastMessageByUser;
@override final  String? lastMessageAt;
@override final  int unreadCount;
 final  List<BasicUser> _otherUsers;
@override List<BasicUser> get otherUsers {
  if (_otherUsers is EqualUnmodifiableListView) return _otherUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_otherUsers);
}


/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationCopyWith<_Conversation> get copyWith => __$ConversationCopyWithImpl<_Conversation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Conversation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageByUserId, lastMessageByUserId) || other.lastMessageByUserId == lastMessageByUserId)&&(identical(other.lastMessageByUser, lastMessageByUser) || other.lastMessageByUser == lastMessageByUser)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&const DeepCollectionEquality().equals(other._otherUsers, _otherUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,lastMessage,lastMessageByUserId,lastMessageByUser,lastMessageAt,unreadCount,const DeepCollectionEquality().hash(_otherUsers));

@override
String toString() {
  return 'Conversation(id: $id, name: $name, type: $type, lastMessage: $lastMessage, lastMessageByUserId: $lastMessageByUserId, lastMessageByUser: $lastMessageByUser, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount, otherUsers: $otherUsers)';
}


}

/// @nodoc
abstract mixin class _$ConversationCopyWith<$Res> implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(_Conversation value, $Res Function(_Conversation) _then) = __$ConversationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, String? lastMessage, String? lastMessageByUserId, BasicUser? lastMessageByUser, String? lastMessageAt, int unreadCount, List<BasicUser> otherUsers
});


@override $BasicUserCopyWith<$Res>? get lastMessageByUser;

}
/// @nodoc
class __$ConversationCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(this._self, this._then);

  final _Conversation _self;
  final $Res Function(_Conversation) _then;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? lastMessage = freezed,Object? lastMessageByUserId = freezed,Object? lastMessageByUser = freezed,Object? lastMessageAt = freezed,Object? unreadCount = null,Object? otherUsers = null,}) {
  return _then(_Conversation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,lastMessageByUserId: freezed == lastMessageByUserId ? _self.lastMessageByUserId : lastMessageByUserId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageByUser: freezed == lastMessageByUser ? _self.lastMessageByUser : lastMessageByUser // ignore: cast_nullable_to_non_nullable
as BasicUser?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as String?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,otherUsers: null == otherUsers ? _self._otherUsers : otherUsers // ignore: cast_nullable_to_non_nullable
as List<BasicUser>,
  ));
}

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasicUserCopyWith<$Res>? get lastMessageByUser {
    if (_self.lastMessageByUser == null) {
    return null;
  }

  return $BasicUserCopyWith<$Res>(_self.lastMessageByUser!, (value) {
    return _then(_self.copyWith(lastMessageByUser: value));
  });
}
}

// dart format on
