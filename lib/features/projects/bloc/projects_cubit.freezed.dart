// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectsState {

 ProjectsStatus get status; List<ProjectModel> get projects;
/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsStateCopyWith<ProjectsState> get copyWith => _$ProjectsStateCopyWithImpl<ProjectsState>(this as ProjectsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProjectsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.projects, _this.projects));
}


@override
int get hashCode {
  final _this = this as ProjectsState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.projects));
}

@override
String toString() {
  final _this = this as ProjectsState;
  return 'ProjectsState(status: ${_this.status}, projects: ${_this.projects})';
}


}

/// @nodoc
abstract mixin class $ProjectsStateCopyWith<$Res>  {
  factory $ProjectsStateCopyWith(ProjectsState value, $Res Function(ProjectsState) _then) = _$ProjectsStateCopyWithImpl;
@useResult
$Res call({
 ProjectsStatus status, List<ProjectModel> projects
});




}
/// @nodoc
class _$ProjectsStateCopyWithImpl<$Res>
    implements $ProjectsStateCopyWith<$Res> {
  _$ProjectsStateCopyWithImpl(this._self, this._then);

  final ProjectsState _self;
  final $Res Function(ProjectsState) _then;

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? projects = null,}) {
  return _then(ProjectsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectsStatus,projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectsState].
extension ProjectsStatePatterns on ProjectsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectsState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectsState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProjectsStatus status,  List<ProjectModel> projects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectsState() when $default != null:
return $default(_that.status,_that.projects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProjectsStatus status,  List<ProjectModel> projects)  $default,) {final _that = this;
switch (_that) {
case _ProjectsState():
return $default(_that.status,_that.projects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProjectsStatus status,  List<ProjectModel> projects)?  $default,) {final _that = this;
switch (_that) {
case _ProjectsState() when $default != null:
return $default(_that.status,_that.projects);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectsState implements ProjectsState {
  const _ProjectsState({this.status = ProjectsStatus.initial,  List<ProjectModel> projects = const []}): _projects = projects;
  

@override@JsonKey() final  ProjectsStatus status;
 final  List<ProjectModel> _projects;
@override@JsonKey() List<ProjectModel> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}


/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectsStateCopyWith<_ProjectsState> get copyWith => __$ProjectsStateCopyWithImpl<_ProjectsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.projects, _projects));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_projects));
}

@override
String toString() {
    return 'ProjectsState(status: $status, projects: $projects)';
}


}

/// @nodoc
abstract mixin class _$ProjectsStateCopyWith<$Res> implements $ProjectsStateCopyWith<$Res> {
  factory _$ProjectsStateCopyWith(_ProjectsState value, $Res Function(_ProjectsState) _then) = __$ProjectsStateCopyWithImpl;
@override @useResult
$Res call({
 ProjectsStatus status, List<ProjectModel> projects
});




}
/// @nodoc
class __$ProjectsStateCopyWithImpl<$Res>
    implements _$ProjectsStateCopyWith<$Res> {
  __$ProjectsStateCopyWithImpl(this._self, this._then);

  final _ProjectsState _self;
  final $Res Function(_ProjectsState) _then;

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? projects = null,}) {
  return _then(_ProjectsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectsStatus,projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectModel>,
  ));
}


}

// dart format on
