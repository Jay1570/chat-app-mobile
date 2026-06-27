// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationListState {

 List<Conversation> get conversations; String? get nextCursor; String? get nextCursorId; bool get clearCursor; bool get isLoading; bool get isLoadingMore; String? get error;
/// Create a copy of ConversationListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationListStateCopyWith<ConversationListState> get copyWith => _$ConversationListStateCopyWithImpl<ConversationListState>(this as ConversationListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationListState&&const DeepCollectionEquality().equals(other.conversations, conversations)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.nextCursorId, nextCursorId) || other.nextCursorId == nextCursorId)&&(identical(other.clearCursor, clearCursor) || other.clearCursor == clearCursor)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(conversations),nextCursor,nextCursorId,clearCursor,isLoading,isLoadingMore,error);

@override
String toString() {
  return 'ConversationListState(conversations: $conversations, nextCursor: $nextCursor, nextCursorId: $nextCursorId, clearCursor: $clearCursor, isLoading: $isLoading, isLoadingMore: $isLoadingMore, error: $error)';
}


}

/// @nodoc
abstract mixin class $ConversationListStateCopyWith<$Res>  {
  factory $ConversationListStateCopyWith(ConversationListState value, $Res Function(ConversationListState) _then) = _$ConversationListStateCopyWithImpl;
@useResult
$Res call({
 List<Conversation> conversations, String? nextCursor, String? nextCursorId, bool clearCursor, bool isLoading, bool isLoadingMore, String? error
});




}
/// @nodoc
class _$ConversationListStateCopyWithImpl<$Res>
    implements $ConversationListStateCopyWith<$Res> {
  _$ConversationListStateCopyWithImpl(this._self, this._then);

  final ConversationListState _self;
  final $Res Function(ConversationListState) _then;

/// Create a copy of ConversationListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversations = null,Object? nextCursor = freezed,Object? nextCursorId = freezed,Object? clearCursor = null,Object? isLoading = null,Object? isLoadingMore = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
conversations: null == conversations ? _self.conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<Conversation>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,nextCursorId: freezed == nextCursorId ? _self.nextCursorId : nextCursorId // ignore: cast_nullable_to_non_nullable
as String?,clearCursor: null == clearCursor ? _self.clearCursor : clearCursor // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationListState].
extension ConversationListStatePatterns on ConversationListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationListState value)  $default,){
final _that = this;
switch (_that) {
case _ConversationListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationListState value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Conversation> conversations,  String? nextCursor,  String? nextCursorId,  bool clearCursor,  bool isLoading,  bool isLoadingMore,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationListState() when $default != null:
return $default(_that.conversations,_that.nextCursor,_that.nextCursorId,_that.clearCursor,_that.isLoading,_that.isLoadingMore,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Conversation> conversations,  String? nextCursor,  String? nextCursorId,  bool clearCursor,  bool isLoading,  bool isLoadingMore,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ConversationListState():
return $default(_that.conversations,_that.nextCursor,_that.nextCursorId,_that.clearCursor,_that.isLoading,_that.isLoadingMore,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Conversation> conversations,  String? nextCursor,  String? nextCursorId,  bool clearCursor,  bool isLoading,  bool isLoadingMore,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ConversationListState() when $default != null:
return $default(_that.conversations,_that.nextCursor,_that.nextCursorId,_that.clearCursor,_that.isLoading,_that.isLoadingMore,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ConversationListState extends ConversationListState {
  const _ConversationListState({final  List<Conversation> conversations = const [], this.nextCursor, this.nextCursorId, this.clearCursor = false, this.isLoading = false, this.isLoadingMore = false, this.error}): _conversations = conversations,super._();
  

 final  List<Conversation> _conversations;
@override@JsonKey() List<Conversation> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}

@override final  String? nextCursor;
@override final  String? nextCursorId;
@override@JsonKey() final  bool clearCursor;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingMore;
@override final  String? error;

/// Create a copy of ConversationListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationListStateCopyWith<_ConversationListState> get copyWith => __$ConversationListStateCopyWithImpl<_ConversationListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationListState&&const DeepCollectionEquality().equals(other._conversations, _conversations)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.nextCursorId, nextCursorId) || other.nextCursorId == nextCursorId)&&(identical(other.clearCursor, clearCursor) || other.clearCursor == clearCursor)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations),nextCursor,nextCursorId,clearCursor,isLoading,isLoadingMore,error);

@override
String toString() {
  return 'ConversationListState(conversations: $conversations, nextCursor: $nextCursor, nextCursorId: $nextCursorId, clearCursor: $clearCursor, isLoading: $isLoading, isLoadingMore: $isLoadingMore, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ConversationListStateCopyWith<$Res> implements $ConversationListStateCopyWith<$Res> {
  factory _$ConversationListStateCopyWith(_ConversationListState value, $Res Function(_ConversationListState) _then) = __$ConversationListStateCopyWithImpl;
@override @useResult
$Res call({
 List<Conversation> conversations, String? nextCursor, String? nextCursorId, bool clearCursor, bool isLoading, bool isLoadingMore, String? error
});




}
/// @nodoc
class __$ConversationListStateCopyWithImpl<$Res>
    implements _$ConversationListStateCopyWith<$Res> {
  __$ConversationListStateCopyWithImpl(this._self, this._then);

  final _ConversationListState _self;
  final $Res Function(_ConversationListState) _then;

/// Create a copy of ConversationListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversations = null,Object? nextCursor = freezed,Object? nextCursorId = freezed,Object? clearCursor = null,Object? isLoading = null,Object? isLoadingMore = null,Object? error = freezed,}) {
  return _then(_ConversationListState(
conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<Conversation>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,nextCursorId: freezed == nextCursorId ? _self.nextCursorId : nextCursorId // ignore: cast_nullable_to_non_nullable
as String?,clearCursor: null == clearCursor ? _self.clearCursor : clearCursor // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
