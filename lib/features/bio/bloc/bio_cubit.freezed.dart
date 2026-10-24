// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bio_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BioState {

 LoadStatus get status; PortfolioUserModel? get user; List<PortfolioSkillsModel>? get skills; List<ProjectModel> get projects; Object? get error;
/// Create a copy of BioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BioStateCopyWith<BioState> get copyWith => _$BioStateCopyWithImpl<BioState>(this as BioState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BioState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BioState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.user, _this.user) || other.user == _this.user)&&const DeepCollectionEquality().equals(other.skills, _this.skills)&&const DeepCollectionEquality().equals(other.projects, _this.projects)&&const DeepCollectionEquality().equals(other.error, _this.error));
}


@override
int get hashCode {
  final _this = this as BioState;
  return Object.hash(runtimeType,_this.status,_this.user,const DeepCollectionEquality().hash(_this.skills),const DeepCollectionEquality().hash(_this.projects),const DeepCollectionEquality().hash(_this.error));
}

@override
String toString() {
  final _this = this as BioState;
  return 'BioState(status: ${_this.status}, user: ${_this.user}, skills: ${_this.skills}, projects: ${_this.projects}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $BioStateCopyWith<$Res>  {
  factory $BioStateCopyWith(BioState value, $Res Function(BioState) _then) = _$BioStateCopyWithImpl;
@useResult
$Res call({
 LoadStatus status, PortfolioUserModel? user, List<PortfolioSkillsModel>? skills, List<ProjectModel> projects, Object? error
});




}
/// @nodoc
class _$BioStateCopyWithImpl<$Res>
    implements $BioStateCopyWith<$Res> {
  _$BioStateCopyWithImpl(this._self, this._then);

  final BioState _self;
  final $Res Function(BioState) _then;

/// Create a copy of BioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? user = freezed,Object? skills = freezed,Object? projects = null,Object? error = freezed,}) {
  return _then(BioState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadStatus,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as PortfolioUserModel?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<PortfolioSkillsModel>?,projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectModel>,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [BioState].
extension BioStatePatterns on BioState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BioState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BioState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BioState value)  $default,){
final _that = this;
switch (_that) {
case _BioState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BioState value)?  $default,){
final _that = this;
switch (_that) {
case _BioState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadStatus status,  PortfolioUserModel? user,  List<PortfolioSkillsModel>? skills,  List<ProjectModel> projects,  Object? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BioState() when $default != null:
return $default(_that.status,_that.user,_that.skills,_that.projects,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadStatus status,  PortfolioUserModel? user,  List<PortfolioSkillsModel>? skills,  List<ProjectModel> projects,  Object? error)  $default,) {final _that = this;
switch (_that) {
case _BioState():
return $default(_that.status,_that.user,_that.skills,_that.projects,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadStatus status,  PortfolioUserModel? user,  List<PortfolioSkillsModel>? skills,  List<ProjectModel> projects,  Object? error)?  $default,) {final _that = this;
switch (_that) {
case _BioState() when $default != null:
return $default(_that.status,_that.user,_that.skills,_that.projects,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _BioState extends BioState {
  const _BioState({this.status = LoadStatus.initial, this.user,  List<PortfolioSkillsModel>? skills,  List<ProjectModel> projects = const [], this.error}): _skills = skills,_projects = projects,super._();
  

@override@JsonKey() final  LoadStatus status;
@override final  PortfolioUserModel? user;
 final  List<PortfolioSkillsModel>? _skills;
@override List<PortfolioSkillsModel>? get skills {
  final value = _skills;
  if (value == null) return null;
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProjectModel> _projects;
@override@JsonKey() List<ProjectModel> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

@override final  Object? error;

/// Create a copy of BioState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BioStateCopyWith<_BioState> get copyWith => __$BioStateCopyWithImpl<_BioState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BioState&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.skills, _skills)&&const DeepCollectionEquality().equals(other.projects, _projects)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,user,const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_projects),const DeepCollectionEquality().hash(error));
}

@override
String toString() {
    return 'BioState(status: $status, user: $user, skills: $skills, projects: $projects, error: $error)';
}


}

/// @nodoc
abstract mixin class _$BioStateCopyWith<$Res> implements $BioStateCopyWith<$Res> {
  factory _$BioStateCopyWith(_BioState value, $Res Function(_BioState) _then) = __$BioStateCopyWithImpl;
@override @useResult
$Res call({
 LoadStatus status, PortfolioUserModel? user, List<PortfolioSkillsModel>? skills, List<ProjectModel> projects, Object? error
});




}
/// @nodoc
class __$BioStateCopyWithImpl<$Res>
    implements _$BioStateCopyWith<$Res> {
  __$BioStateCopyWithImpl(this._self, this._then);

  final _BioState _self;
  final $Res Function(_BioState) _then;

/// Create a copy of BioState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? user = freezed,Object? skills = freezed,Object? projects = null,Object? error = freezed,}) {
  return _then(_BioState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadStatus,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as PortfolioUserModel?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<PortfolioSkillsModel>?,projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectModel>,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
