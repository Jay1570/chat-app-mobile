// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MessageState {

 List<Message> get messages; List<ReadStatus> get readStatus; bool get isLoading; bool get isLoadingMore; String? get error; String? get nextCursor;
/// Create a copy of MessageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageStateCopyWith<MessageState> get copyWith => _$MessageStateCopyWithImpl<MessageState>(this as MessageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageState&&const DeepCollectionEquality().equals(other.messages, messages)&&const DeepCollectionEquality().equals(other.readStatus, readStatus)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.error, error) || other.error == error)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),const DeepCollectionEquality().hash(readStatus),isLoading,isLoadingMore,error,nextCursor);

@override
String toString() {
  return 'MessageState(messages: $messages, readStatus: $readStatus, isLoading: $isLoading, isLoadingMore: $isLoadingMore, error: $error, nextCursor: $nextCursor)';
}


}

/// @nodoc
abstract mixin class $MessageStateCopyWith<$Res>  {
  factory $MessageStateCopyWith(MessageState value, $Res Function(MessageState) _then) = _$MessageStateCopyWithImpl;
@useResult
$Res call({
 List<Message> messages, List<ReadStatus> readStatus, bool isLoading, bool isLoadingMore, String? error, String? nextCursor
});




}
/// @nodoc
class _$MessageStateCopyWithImpl<$Res>
    implements $MessageStateCopyWith<$Res> {
  _$MessageStateCopyWithImpl(this._self, this._then);

  final MessageState _self;
  final $Res Function(MessageState) _then;

/// Create a copy of MessageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? readStatus = null,Object? isLoading = null,Object? isLoadingMore = null,Object? error = freezed,Object? nextCursor = freezed,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,readStatus: null == readStatus ? _self.readStatus : readStatus // ignore: cast_nullable_to_non_nullable
as List<ReadStatus>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageState].
extension MessageStatePatterns on MessageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageState value)  $default,){
final _that = this;
switch (_that) {
case _MessageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageState value)?  $default,){
final _that = this;
switch (_that) {
case _MessageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Message> messages,  List<ReadStatus> readStatus,  bool isLoading,  bool isLoadingMore,  String? error,  String? nextCursor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageState() when $default != null:
return $default(_that.messages,_that.readStatus,_that.isLoading,_that.isLoadingMore,_that.error,_that.nextCursor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Message> messages,  List<ReadStatus> readStatus,  bool isLoading,  bool isLoadingMore,  String? error,  String? nextCursor)  $default,) {final _that = this;
switch (_that) {
case _MessageState():
return $default(_that.messages,_that.readStatus,_that.isLoading,_that.isLoadingMore,_that.error,_that.nextCursor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Message> messages,  List<ReadStatus> readStatus,  bool isLoading,  bool isLoadingMore,  String? error,  String? nextCursor)?  $default,) {final _that = this;
switch (_that) {
case _MessageState() when $default != null:
return $default(_that.messages,_that.readStatus,_that.isLoading,_that.isLoadingMore,_that.error,_that.nextCursor);case _:
  return null;

}
}

}

/// @nodoc


class _MessageState extends MessageState {
  const _MessageState({final  List<Message> messages = const [], final  List<ReadStatus> readStatus = const [], this.isLoading = false, this.isLoadingMore = false, this.error, this.nextCursor}): _messages = messages,_readStatus = readStatus,super._();
  

 final  List<Message> _messages;
@override@JsonKey() List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

 final  List<ReadStatus> _readStatus;
@override@JsonKey() List<ReadStatus> get readStatus {
  if (_readStatus is EqualUnmodifiableListView) return _readStatus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_readStatus);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingMore;
@override final  String? error;
@override final  String? nextCursor;

/// Create a copy of MessageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageStateCopyWith<_MessageState> get copyWith => __$MessageStateCopyWithImpl<_MessageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageState&&const DeepCollectionEquality().equals(other._messages, _messages)&&const DeepCollectionEquality().equals(other._readStatus, _readStatus)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.error, error) || other.error == error)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),const DeepCollectionEquality().hash(_readStatus),isLoading,isLoadingMore,error,nextCursor);

@override
String toString() {
  return 'MessageState(messages: $messages, readStatus: $readStatus, isLoading: $isLoading, isLoadingMore: $isLoadingMore, error: $error, nextCursor: $nextCursor)';
}


}

/// @nodoc
abstract mixin class _$MessageStateCopyWith<$Res> implements $MessageStateCopyWith<$Res> {
  factory _$MessageStateCopyWith(_MessageState value, $Res Function(_MessageState) _then) = __$MessageStateCopyWithImpl;
@override @useResult
$Res call({
 List<Message> messages, List<ReadStatus> readStatus, bool isLoading, bool isLoadingMore, String? error, String? nextCursor
});




}
/// @nodoc
class __$MessageStateCopyWithImpl<$Res>
    implements _$MessageStateCopyWith<$Res> {
  __$MessageStateCopyWithImpl(this._self, this._then);

  final _MessageState _self;
  final $Res Function(_MessageState) _then;

/// Create a copy of MessageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? readStatus = null,Object? isLoading = null,Object? isLoadingMore = null,Object? error = freezed,Object? nextCursor = freezed,}) {
  return _then(_MessageState(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,readStatus: null == readStatus ? _self._readStatus : readStatus // ignore: cast_nullable_to_non_nullable
as List<ReadStatus>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
