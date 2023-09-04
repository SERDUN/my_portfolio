// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bio_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BioState {
  BioStatus get status => throw _privateConstructorUsedError;
  PortfolioUserModel? get user => throw _privateConstructorUsedError;
  List<PortfolioSkillsModel>? get skills => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BioStateCopyWith<BioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BioStateCopyWith<$Res> {
  factory $BioStateCopyWith(BioState value, $Res Function(BioState) then) =
      _$BioStateCopyWithImpl<$Res, BioState>;
  @useResult
  $Res call(
      {BioStatus status,
      PortfolioUserModel? user,
      List<PortfolioSkillsModel>? skills});
}

/// @nodoc
class _$BioStateCopyWithImpl<$Res, $Val extends BioState>
    implements $BioStateCopyWith<$Res> {
  _$BioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? skills = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BioStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PortfolioUserModel?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<PortfolioSkillsModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BioStateCopyWith<$Res> implements $BioStateCopyWith<$Res> {
  factory _$$_BioStateCopyWith(
          _$_BioState value, $Res Function(_$_BioState) then) =
      __$$_BioStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BioStatus status,
      PortfolioUserModel? user,
      List<PortfolioSkillsModel>? skills});
}

/// @nodoc
class __$$_BioStateCopyWithImpl<$Res>
    extends _$BioStateCopyWithImpl<$Res, _$_BioState>
    implements _$$_BioStateCopyWith<$Res> {
  __$$_BioStateCopyWithImpl(
      _$_BioState _value, $Res Function(_$_BioState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? skills = freezed,
  }) {
    return _then(_$_BioState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BioStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PortfolioUserModel?,
      skills: freezed == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<PortfolioSkillsModel>?,
    ));
  }
}

/// @nodoc

class _$_BioState implements _BioState {
  const _$_BioState(
      {this.status = BioStatus.initial,
      this.user,
      final List<PortfolioSkillsModel>? skills})
      : _skills = skills;

  @override
  @JsonKey()
  final BioStatus status;
  @override
  final PortfolioUserModel? user;
  final List<PortfolioSkillsModel>? _skills;
  @override
  List<PortfolioSkillsModel>? get skills {
    final value = _skills;
    if (value == null) return null;
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BioState(status: $status, user: $user, skills: $skills)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BioState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._skills, _skills));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, user, const DeepCollectionEquality().hash(_skills));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BioStateCopyWith<_$_BioState> get copyWith =>
      __$$_BioStateCopyWithImpl<_$_BioState>(this, _$identity);
}

abstract class _BioState implements BioState {
  const factory _BioState(
      {final BioStatus status,
      final PortfolioUserModel? user,
      final List<PortfolioSkillsModel>? skills}) = _$_BioState;

  @override
  BioStatus get status;
  @override
  PortfolioUserModel? get user;
  @override
  List<PortfolioSkillsModel>? get skills;
  @override
  @JsonKey(ignore: true)
  _$$_BioStateCopyWith<_$_BioState> get copyWith =>
      throw _privateConstructorUsedError;
}
