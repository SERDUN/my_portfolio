// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectsState {
  ProjectsStatus get status => throw _privateConstructorUsedError;
  List<ProjectModel> get projects => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectsStateCopyWith<ProjectsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsStateCopyWith<$Res> {
  factory $ProjectsStateCopyWith(
          ProjectsState value, $Res Function(ProjectsState) then) =
      _$ProjectsStateCopyWithImpl<$Res, ProjectsState>;
  @useResult
  $Res call({ProjectsStatus status, List<ProjectModel> projects});
}

/// @nodoc
class _$ProjectsStateCopyWithImpl<$Res, $Val extends ProjectsState>
    implements $ProjectsStateCopyWith<$Res> {
  _$ProjectsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? projects = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectsStatus,
      projects: null == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectsStateCopyWith<$Res>
    implements $ProjectsStateCopyWith<$Res> {
  factory _$$_ProjectsStateCopyWith(
          _$_ProjectsState value, $Res Function(_$_ProjectsState) then) =
      __$$_ProjectsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProjectsStatus status, List<ProjectModel> projects});
}

/// @nodoc
class __$$_ProjectsStateCopyWithImpl<$Res>
    extends _$ProjectsStateCopyWithImpl<$Res, _$_ProjectsState>
    implements _$$_ProjectsStateCopyWith<$Res> {
  __$$_ProjectsStateCopyWithImpl(
      _$_ProjectsState _value, $Res Function(_$_ProjectsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? projects = null,
  }) {
    return _then(_$_ProjectsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectsStatus,
      projects: null == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>,
    ));
  }
}

/// @nodoc

class _$_ProjectsState implements _ProjectsState {
  const _$_ProjectsState(
      {this.status = ProjectsStatus.initial,
      final List<ProjectModel> projects = const []})
      : _projects = projects;

  @override
  @JsonKey()
  final ProjectsStatus status;
  final List<ProjectModel> _projects;
  @override
  @JsonKey()
  List<ProjectModel> get projects {
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  @override
  String toString() {
    return 'ProjectsState(status: $status, projects: $projects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._projects, _projects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_projects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectsStateCopyWith<_$_ProjectsState> get copyWith =>
      __$$_ProjectsStateCopyWithImpl<_$_ProjectsState>(this, _$identity);
}

abstract class _ProjectsState implements ProjectsState {
  const factory _ProjectsState(
      {final ProjectsStatus status,
      final List<ProjectModel> projects}) = _$_ProjectsState;

  @override
  ProjectsStatus get status;
  @override
  List<ProjectModel> get projects;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectsStateCopyWith<_$_ProjectsState> get copyWith =>
      throw _privateConstructorUsedError;
}
