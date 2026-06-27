// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationListResponse {

 List<Conversation> get conversations; String? get nextCursor; String? get nextCursorId;
/// Create a copy of ConversationListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationListResponseCopyWith<ConversationListResponse> get copyWith => _$ConversationListResponseCopyWithImpl<ConversationListResponse>(this as ConversationListResponse, _$identity);

  /// Serializes this ConversationListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationListResponse&&const DeepCollectionEquality().equals(other.conversations, conversations)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.nextCursorId, nextCursorId) || other.nextCursorId == nextCursorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(conversations),nextCursor,nextCursorId);

@override
String toString() {
  return 'ConversationListResponse(conversations: $conversations, nextCursor: $nextCursor, nextCursorId: $nextCursorId)';
}


}

/// @nodoc
abstract mixin class $ConversationListResponseCopyWith<$Res>  {
  factory $ConversationListResponseCopyWith(ConversationListResponse value, $Res Function(ConversationListResponse) _then) = _$ConversationListResponseCopyWithImpl;
@useResult
$Res call({
 List<Conversation> conversations, String? nextCursor, String? nextCursorId
});




}
/// @nodoc
class _$ConversationListResponseCopyWithImpl<$Res>
    implements $ConversationListResponseCopyWith<$Res> {
  _$ConversationListResponseCopyWithImpl(this._self, this._then);

  final ConversationListResponse _self;
  final $Res Function(ConversationListResponse) _then;

/// Create a copy of ConversationListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversations = null,Object? nextCursor = freezed,Object? nextCursorId = freezed,}) {
  return _then(_self.copyWith(
conversations: null == conversations ? _self.conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<Conversation>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,nextCursorId: freezed == nextCursorId ? _self.nextCursorId : nextCursorId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationListResponse].
extension ConversationListResponsePatterns on ConversationListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ConversationListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Conversation> conversations,  String? nextCursor,  String? nextCursorId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationListResponse() when $default != null:
return $default(_that.conversations,_that.nextCursor,_that.nextCursorId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Conversation> conversations,  String? nextCursor,  String? nextCursorId)  $default,) {final _that = this;
switch (_that) {
case _ConversationListResponse():
return $default(_that.conversations,_that.nextCursor,_that.nextCursorId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Conversation> conversations,  String? nextCursor,  String? nextCursorId)?  $default,) {final _that = this;
switch (_that) {
case _ConversationListResponse() when $default != null:
return $default(_that.conversations,_that.nextCursor,_that.nextCursorId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationListResponse implements ConversationListResponse {
  const _ConversationListResponse({required final  List<Conversation> conversations, this.nextCursor, this.nextCursorId}): _conversations = conversations;
  factory _ConversationListResponse.fromJson(Map<String, dynamic> json) => _$ConversationListResponseFromJson(json);

 final  List<Conversation> _conversations;
@override List<Conversation> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}

@override final  String? nextCursor;
@override final  String? nextCursorId;

/// Create a copy of ConversationListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationListResponseCopyWith<_ConversationListResponse> get copyWith => __$ConversationListResponseCopyWithImpl<_ConversationListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationListResponse&&const DeepCollectionEquality().equals(other._conversations, _conversations)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.nextCursorId, nextCursorId) || other.nextCursorId == nextCursorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations),nextCursor,nextCursorId);

@override
String toString() {
  return 'ConversationListResponse(conversations: $conversations, nextCursor: $nextCursor, nextCursorId: $nextCursorId)';
}


}

/// @nodoc
abstract mixin class _$ConversationListResponseCopyWith<$Res> implements $ConversationListResponseCopyWith<$Res> {
  factory _$ConversationListResponseCopyWith(_ConversationListResponse value, $Res Function(_ConversationListResponse) _then) = __$ConversationListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Conversation> conversations, String? nextCursor, String? nextCursorId
});




}
/// @nodoc
class __$ConversationListResponseCopyWithImpl<$Res>
    implements _$ConversationListResponseCopyWith<$Res> {
  __$ConversationListResponseCopyWithImpl(this._self, this._then);

  final _ConversationListResponse _self;
  final $Res Function(_ConversationListResponse) _then;

/// Create a copy of ConversationListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversations = null,Object? nextCursor = freezed,Object? nextCursorId = freezed,}) {
  return _then(_ConversationListResponse(
conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<Conversation>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,nextCursorId: freezed == nextCursorId ? _self.nextCursorId : nextCursorId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
