// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageListResponse {

 List<Message> get messages; List<ReadStatus> get readStatus; BasicConversation get conversation;
/// Create a copy of MessageListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageListResponseCopyWith<MessageListResponse> get copyWith => _$MessageListResponseCopyWithImpl<MessageListResponse>(this as MessageListResponse, _$identity);

  /// Serializes this MessageListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageListResponse&&const DeepCollectionEquality().equals(other.messages, messages)&&const DeepCollectionEquality().equals(other.readStatus, readStatus)&&(identical(other.conversation, conversation) || other.conversation == conversation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),const DeepCollectionEquality().hash(readStatus),conversation);

@override
String toString() {
  return 'MessageListResponse(messages: $messages, readStatus: $readStatus, conversation: $conversation)';
}


}

/// @nodoc
abstract mixin class $MessageListResponseCopyWith<$Res>  {
  factory $MessageListResponseCopyWith(MessageListResponse value, $Res Function(MessageListResponse) _then) = _$MessageListResponseCopyWithImpl;
@useResult
$Res call({
 List<Message> messages, List<ReadStatus> readStatus, BasicConversation conversation
});


$BasicConversationCopyWith<$Res> get conversation;

}
/// @nodoc
class _$MessageListResponseCopyWithImpl<$Res>
    implements $MessageListResponseCopyWith<$Res> {
  _$MessageListResponseCopyWithImpl(this._self, this._then);

  final MessageListResponse _self;
  final $Res Function(MessageListResponse) _then;

/// Create a copy of MessageListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? readStatus = null,Object? conversation = null,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,readStatus: null == readStatus ? _self.readStatus : readStatus // ignore: cast_nullable_to_non_nullable
as List<ReadStatus>,conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as BasicConversation,
  ));
}
/// Create a copy of MessageListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasicConversationCopyWith<$Res> get conversation {
  
  return $BasicConversationCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}


/// Adds pattern-matching-related methods to [MessageListResponse].
extension MessageListResponsePatterns on MessageListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageListResponse value)  $default,){
final _that = this;
switch (_that) {
case _MessageListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MessageListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Message> messages,  List<ReadStatus> readStatus,  BasicConversation conversation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageListResponse() when $default != null:
return $default(_that.messages,_that.readStatus,_that.conversation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Message> messages,  List<ReadStatus> readStatus,  BasicConversation conversation)  $default,) {final _that = this;
switch (_that) {
case _MessageListResponse():
return $default(_that.messages,_that.readStatus,_that.conversation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Message> messages,  List<ReadStatus> readStatus,  BasicConversation conversation)?  $default,) {final _that = this;
switch (_that) {
case _MessageListResponse() when $default != null:
return $default(_that.messages,_that.readStatus,_that.conversation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageListResponse implements MessageListResponse {
  const _MessageListResponse({required final  List<Message> messages, required final  List<ReadStatus> readStatus, required this.conversation}): _messages = messages,_readStatus = readStatus;
  factory _MessageListResponse.fromJson(Map<String, dynamic> json) => _$MessageListResponseFromJson(json);

 final  List<Message> _messages;
@override List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

 final  List<ReadStatus> _readStatus;
@override List<ReadStatus> get readStatus {
  if (_readStatus is EqualUnmodifiableListView) return _readStatus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_readStatus);
}

@override final  BasicConversation conversation;

/// Create a copy of MessageListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageListResponseCopyWith<_MessageListResponse> get copyWith => __$MessageListResponseCopyWithImpl<_MessageListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageListResponse&&const DeepCollectionEquality().equals(other._messages, _messages)&&const DeepCollectionEquality().equals(other._readStatus, _readStatus)&&(identical(other.conversation, conversation) || other.conversation == conversation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),const DeepCollectionEquality().hash(_readStatus),conversation);

@override
String toString() {
  return 'MessageListResponse(messages: $messages, readStatus: $readStatus, conversation: $conversation)';
}


}

/// @nodoc
abstract mixin class _$MessageListResponseCopyWith<$Res> implements $MessageListResponseCopyWith<$Res> {
  factory _$MessageListResponseCopyWith(_MessageListResponse value, $Res Function(_MessageListResponse) _then) = __$MessageListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Message> messages, List<ReadStatus> readStatus, BasicConversation conversation
});


@override $BasicConversationCopyWith<$Res> get conversation;

}
/// @nodoc
class __$MessageListResponseCopyWithImpl<$Res>
    implements _$MessageListResponseCopyWith<$Res> {
  __$MessageListResponseCopyWithImpl(this._self, this._then);

  final _MessageListResponse _self;
  final $Res Function(_MessageListResponse) _then;

/// Create a copy of MessageListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? readStatus = null,Object? conversation = null,}) {
  return _then(_MessageListResponse(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,readStatus: null == readStatus ? _self._readStatus : readStatus // ignore: cast_nullable_to_non_nullable
as List<ReadStatus>,conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as BasicConversation,
  ));
}

/// Create a copy of MessageListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasicConversationCopyWith<$Res> get conversation {
  
  return $BasicConversationCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}

// dart format on
