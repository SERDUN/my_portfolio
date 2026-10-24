part of 'contacts_cubit.dart';

@freezed
abstract class ContactsState with _$ContactsState {
  const factory ContactsState({
    @Default(LoadStatus.initial) LoadStatus status,
    @Default([]) List<ContactModel> contacts,
    Object? error,
  }) = _ContactsState;
}
