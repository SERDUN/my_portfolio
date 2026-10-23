// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contacts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContactsState {

 ContactsStatus get status; List<ContactsModel>? get contacts;
/// Create a copy of ContactsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactsStateCopyWith<ContactsState> get copyWith => _$ContactsStateCopyWithImpl<ContactsState>(this as ContactsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ContactsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactsState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.contacts, _this.contacts));
}


@override
int get hashCode {
  final _this = this as ContactsState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.contacts));
}

@override
String toString() {
  final _this = this as ContactsState;
  return 'ContactsState(status: ${_this.status}, contacts: ${_this.contacts})';
}


}

/// @nodoc
abstract mixin class $ContactsStateCopyWith<$Res>  {
  factory $ContactsStateCopyWith(ContactsState value, $Res Function(ContactsState) _then) = _$ContactsStateCopyWithImpl;
@useResult
$Res call({
 ContactsStatus status, List<ContactsModel>? contacts
});




}
/// @nodoc
class _$ContactsStateCopyWithImpl<$Res>
    implements $ContactsStateCopyWith<$Res> {
  _$ContactsStateCopyWithImpl(this._self, this._then);

  final ContactsState _self;
  final $Res Function(ContactsState) _then;

/// Create a copy of ContactsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? contacts = freezed,}) {
  return _then(ContactsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContactsStatus,contacts: freezed == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ContactsModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactsState].
extension ContactsStatePatterns on ContactsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactsState value)  $default,){
final _that = this;
switch (_that) {
case _ContactsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactsState value)?  $default,){
final _that = this;
switch (_that) {
case _ContactsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContactsStatus status,  List<ContactsModel>? contacts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactsState() when $default != null:
return $default(_that.status,_that.contacts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContactsStatus status,  List<ContactsModel>? contacts)  $default,) {final _that = this;
switch (_that) {
case _ContactsState():
return $default(_that.status,_that.contacts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContactsStatus status,  List<ContactsModel>? contacts)?  $default,) {final _that = this;
switch (_that) {
case _ContactsState() when $default != null:
return $default(_that.status,_that.contacts);case _:
  return null;

}
}

}

/// @nodoc


class _ContactsState implements ContactsState {
  const _ContactsState({this.status = ContactsStatus.initial,  List<ContactsModel>? contacts}): _contacts = contacts;
  

@override@JsonKey() final  ContactsStatus status;
 final  List<ContactsModel>? _contacts;
@override List<ContactsModel>? get contacts {
  final value = _contacts;
  if (value == null) return null;
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ContactsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactsStateCopyWith<_ContactsState> get copyWith => __$ContactsStateCopyWithImpl<_ContactsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.contacts, _contacts));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_contacts));
}

@override
String toString() {
    return 'ContactsState(status: $status, contacts: $contacts)';
}


}

/// @nodoc
abstract mixin class _$ContactsStateCopyWith<$Res> implements $ContactsStateCopyWith<$Res> {
  factory _$ContactsStateCopyWith(_ContactsState value, $Res Function(_ContactsState) _then) = __$ContactsStateCopyWithImpl;
@override @useResult
$Res call({
 ContactsStatus status, List<ContactsModel>? contacts
});




}
/// @nodoc
class __$ContactsStateCopyWithImpl<$Res>
    implements _$ContactsStateCopyWith<$Res> {
  __$ContactsStateCopyWithImpl(this._self, this._then);

  final _ContactsState _self;
  final $Res Function(_ContactsState) _then;

/// Create a copy of ContactsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? contacts = freezed,}) {
  return _then(_ContactsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContactsStatus,contacts: freezed == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ContactsModel>?,
  ));
}


}

// dart format on
