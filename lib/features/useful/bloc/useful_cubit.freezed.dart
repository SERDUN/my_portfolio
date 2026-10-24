// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'useful_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsefulState {

 LoadStatus get status; List<CommandGroupModel> get groups; Object? get error;
/// Create a copy of UsefulState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsefulStateCopyWith<UsefulState> get copyWith => _$UsefulStateCopyWithImpl<UsefulState>(this as UsefulState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UsefulState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsefulState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.groups, _this.groups)&&const DeepCollectionEquality().equals(other.error, _this.error));
}


@override
int get hashCode {
  final _this = this as UsefulState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.groups),const DeepCollectionEquality().hash(_this.error));
}

@override
String toString() {
  final _this = this as UsefulState;
  return 'UsefulState(status: ${_this.status}, groups: ${_this.groups}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $UsefulStateCopyWith<$Res>  {
  factory $UsefulStateCopyWith(UsefulState value, $Res Function(UsefulState) _then) = _$UsefulStateCopyWithImpl;
@useResult
$Res call({
 LoadStatus status, List<CommandGroupModel> groups, Object? error
});




}
/// @nodoc
class _$UsefulStateCopyWithImpl<$Res>
    implements $UsefulStateCopyWith<$Res> {
  _$UsefulStateCopyWithImpl(this._self, this._then);

  final UsefulState _self;
  final $Res Function(UsefulState) _then;

/// Create a copy of UsefulState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? groups = null,Object? error = freezed,}) {
  return _then(UsefulState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadStatus,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<CommandGroupModel>,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [UsefulState].
extension UsefulStatePatterns on UsefulState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsefulState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsefulState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsefulState value)  $default,){
final _that = this;
switch (_that) {
case _UsefulState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsefulState value)?  $default,){
final _that = this;
switch (_that) {
case _UsefulState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadStatus status,  List<CommandGroupModel> groups,  Object? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsefulState() when $default != null:
return $default(_that.status,_that.groups,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadStatus status,  List<CommandGroupModel> groups,  Object? error)  $default,) {final _that = this;
switch (_that) {
case _UsefulState():
return $default(_that.status,_that.groups,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadStatus status,  List<CommandGroupModel> groups,  Object? error)?  $default,) {final _that = this;
switch (_that) {
case _UsefulState() when $default != null:
return $default(_that.status,_that.groups,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _UsefulState implements UsefulState {
  const _UsefulState({this.status = LoadStatus.initial,  List<CommandGroupModel> groups = const [], this.error}): _groups = groups;
  

@override@JsonKey() final  LoadStatus status;
 final  List<CommandGroupModel> _groups;
@override@JsonKey() List<CommandGroupModel> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

@override final  Object? error;

/// Create a copy of UsefulState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsefulStateCopyWith<_UsefulState> get copyWith => __$UsefulStateCopyWithImpl<_UsefulState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsefulState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.groups, _groups)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_groups),const DeepCollectionEquality().hash(error));
}

@override
String toString() {
    return 'UsefulState(status: $status, groups: $groups, error: $error)';
}


}

/// @nodoc
abstract mixin class _$UsefulStateCopyWith<$Res> implements $UsefulStateCopyWith<$Res> {
  factory _$UsefulStateCopyWith(_UsefulState value, $Res Function(_UsefulState) _then) = __$UsefulStateCopyWithImpl;
@override @useResult
$Res call({
 LoadStatus status, List<CommandGroupModel> groups, Object? error
});




}
/// @nodoc
class __$UsefulStateCopyWithImpl<$Res>
    implements _$UsefulStateCopyWith<$Res> {
  __$UsefulStateCopyWithImpl(this._self, this._then);

  final _UsefulState _self;
  final $Res Function(_UsefulState) _then;

/// Create a copy of UsefulState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? groups = null,Object? error = freezed,}) {
  return _then(_UsefulState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadStatus,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<CommandGroupModel>,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
