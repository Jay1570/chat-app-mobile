// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'socket_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocketEvent {

 String get event; Map<String, dynamic> get data;
/// Create a copy of SocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocketEventCopyWith<SocketEvent> get copyWith => _$SocketEventCopyWithImpl<SocketEvent>(this as SocketEvent, _$identity);

  /// Serializes this SocketEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocketEvent&&(identical(other.event, event) || other.event == event)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,event,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SocketEvent(event: $event, data: $data)';
}


}

/// @nodoc
abstract mixin class $SocketEventCopyWith<$Res>  {
  factory $SocketEventCopyWith(SocketEvent value, $Res Function(SocketEvent) _then) = _$SocketEventCopyWithImpl;
@useResult
$Res call({
 String event, Map<String, dynamic> data
});




}
/// @nodoc
class _$SocketEventCopyWithImpl<$Res>
    implements $SocketEventCopyWith<$Res> {
  _$SocketEventCopyWithImpl(this._self, this._then);

  final SocketEvent _self;
  final $Res Function(SocketEvent) _then;

/// Create a copy of SocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? event = null,Object? data = null,}) {
  return _then(_self.copyWith(
event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [SocketEvent].
extension SocketEventPatterns on SocketEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocketEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocketEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocketEvent value)  $default,){
final _that = this;
switch (_that) {
case _SocketEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocketEvent value)?  $default,){
final _that = this;
switch (_that) {
case _SocketEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String event,  Map<String, dynamic> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocketEvent() when $default != null:
return $default(_that.event,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String event,  Map<String, dynamic> data)  $default,) {final _that = this;
switch (_that) {
case _SocketEvent():
return $default(_that.event,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String event,  Map<String, dynamic> data)?  $default,) {final _that = this;
switch (_that) {
case _SocketEvent() when $default != null:
return $default(_that.event,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SocketEvent implements SocketEvent {
  const _SocketEvent({required this.event, required final  Map<String, dynamic> data}): _data = data;
  factory _SocketEvent.fromJson(Map<String, dynamic> json) => _$SocketEventFromJson(json);

@override final  String event;
 final  Map<String, dynamic> _data;
@override Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of SocketEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocketEventCopyWith<_SocketEvent> get copyWith => __$SocketEventCopyWithImpl<_SocketEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocketEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocketEvent&&(identical(other.event, event) || other.event == event)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,event,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SocketEvent(event: $event, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SocketEventCopyWith<$Res> implements $SocketEventCopyWith<$Res> {
  factory _$SocketEventCopyWith(_SocketEvent value, $Res Function(_SocketEvent) _then) = __$SocketEventCopyWithImpl;
@override @useResult
$Res call({
 String event, Map<String, dynamic> data
});




}
/// @nodoc
class __$SocketEventCopyWithImpl<$Res>
    implements _$SocketEventCopyWith<$Res> {
  __$SocketEventCopyWithImpl(this._self, this._then);

  final _SocketEvent _self;
  final $Res Function(_SocketEvent) _then;

/// Create a copy of SocketEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = null,Object? data = null,}) {
  return _then(_SocketEvent(
event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
