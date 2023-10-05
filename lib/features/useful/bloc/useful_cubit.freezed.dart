// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'useful_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsefulState {
  UsefulStatus get status => throw _privateConstructorUsedError;
  List<UsefulCommandsModel> get usefulCommands =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsefulStateCopyWith<UsefulState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsefulStateCopyWith<$Res> {
  factory $UsefulStateCopyWith(
          UsefulState value, $Res Function(UsefulState) then) =
      _$UsefulStateCopyWithImpl<$Res, UsefulState>;
  @useResult
  $Res call({UsefulStatus status, List<UsefulCommandsModel> usefulCommands});
}

/// @nodoc
class _$UsefulStateCopyWithImpl<$Res, $Val extends UsefulState>
    implements $UsefulStateCopyWith<$Res> {
  _$UsefulStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? usefulCommands = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UsefulStatus,
      usefulCommands: null == usefulCommands
          ? _value.usefulCommands
          : usefulCommands // ignore: cast_nullable_to_non_nullable
              as List<UsefulCommandsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsefulStateCopyWith<$Res>
    implements $UsefulStateCopyWith<$Res> {
  factory _$$_UsefulStateCopyWith(
          _$_UsefulState value, $Res Function(_$_UsefulState) then) =
      __$$_UsefulStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UsefulStatus status, List<UsefulCommandsModel> usefulCommands});
}

/// @nodoc
class __$$_UsefulStateCopyWithImpl<$Res>
    extends _$UsefulStateCopyWithImpl<$Res, _$_UsefulState>
    implements _$$_UsefulStateCopyWith<$Res> {
  __$$_UsefulStateCopyWithImpl(
      _$_UsefulState _value, $Res Function(_$_UsefulState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? usefulCommands = null,
  }) {
    return _then(_$_UsefulState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UsefulStatus,
      usefulCommands: null == usefulCommands
          ? _value._usefulCommands
          : usefulCommands // ignore: cast_nullable_to_non_nullable
              as List<UsefulCommandsModel>,
    ));
  }
}

/// @nodoc

class _$_UsefulState implements _UsefulState {
  const _$_UsefulState(
      {this.status = UsefulStatus.initial,
      final List<UsefulCommandsModel> usefulCommands = const []})
      : _usefulCommands = usefulCommands;

  @override
  @JsonKey()
  final UsefulStatus status;
  final List<UsefulCommandsModel> _usefulCommands;
  @override
  @JsonKey()
  List<UsefulCommandsModel> get usefulCommands {
    if (_usefulCommands is EqualUnmodifiableListView) return _usefulCommands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usefulCommands);
  }

  @override
  String toString() {
    return 'UsefulState(status: $status, usefulCommands: $usefulCommands)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsefulState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._usefulCommands, _usefulCommands));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_usefulCommands));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsefulStateCopyWith<_$_UsefulState> get copyWith =>
      __$$_UsefulStateCopyWithImpl<_$_UsefulState>(this, _$identity);
}

abstract class _UsefulState implements UsefulState {
  const factory _UsefulState(
      {final UsefulStatus status,
      final List<UsefulCommandsModel> usefulCommands}) = _$_UsefulState;

  @override
  UsefulStatus get status;
  @override
  List<UsefulCommandsModel> get usefulCommands;
  @override
  @JsonKey(ignore: true)
  _$$_UsefulStateCopyWith<_$_UsefulState> get copyWith =>
      throw _privateConstructorUsedError;
}
