// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BasicConversation {

 String get id; String get name; ConversationType get type;
/// Create a copy of BasicConversation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasicConversationCopyWith<BasicConversation> get copyWith => _$BasicConversationCopyWithImpl<BasicConversation>(this as BasicConversation, _$identity);

  /// Serializes this BasicConversation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasicConversation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type);

@override
String toString() {
  return 'BasicConversation(id: $id, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class $BasicConversationCopyWith<$Res>  {
  factory $BasicConversationCopyWith(BasicConversation value, $Res Function(BasicConversation) _then) = _$BasicConversationCopyWithImpl;
@useResult
$Res call({
 String id, String name, ConversationType type
});




}
/// @nodoc
class _$BasicConversationCopyWithImpl<$Res>
    implements $BasicConversationCopyWith<$Res> {
  _$BasicConversationCopyWithImpl(this._self, this._then);

  final BasicConversation _self;
  final $Res Function(BasicConversation) _then;

/// Create a copy of BasicConversation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ConversationType,
  ));
}

}


/// Adds pattern-matching-related methods to [BasicConversation].
extension BasicConversationPatterns on BasicConversation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasicConversation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasicConversation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasicConversation value)  $default,){
final _that = this;
switch (_that) {
case _BasicConversation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasicConversation value)?  $default,){
final _that = this;
switch (_that) {
case _BasicConversation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  ConversationType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasicConversation() when $default != null:
return $default(_that.id,_that.name,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  ConversationType type)  $default,) {final _that = this;
switch (_that) {
case _BasicConversation():
return $default(_that.id,_that.name,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  ConversationType type)?  $default,) {final _that = this;
switch (_that) {
case _BasicConversation() when $default != null:
return $default(_that.id,_that.name,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasicConversation implements BasicConversation {
  const _BasicConversation({required this.id, required this.name, required this.type});
  factory _BasicConversation.fromJson(Map<String, dynamic> json) => _$BasicConversationFromJson(json);

@override final  String id;
@override final  String name;
@override final  ConversationType type;

/// Create a copy of BasicConversation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasicConversationCopyWith<_BasicConversation> get copyWith => __$BasicConversationCopyWithImpl<_BasicConversation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasicConversationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasicConversation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type);

@override
String toString() {
  return 'BasicConversation(id: $id, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class _$BasicConversationCopyWith<$Res> implements $BasicConversationCopyWith<$Res> {
  factory _$BasicConversationCopyWith(_BasicConversation value, $Res Function(_BasicConversation) _then) = __$BasicConversationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ConversationType type
});




}
/// @nodoc
class __$BasicConversationCopyWithImpl<$Res>
    implements _$BasicConversationCopyWith<$Res> {
  __$BasicConversationCopyWithImpl(this._self, this._then);

  final _BasicConversation _self;
  final $Res Function(_BasicConversation) _then;

/// Create a copy of BasicConversation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,}) {
  return _then(_BasicConversation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ConversationType,
  ));
}


}

// dart format on
