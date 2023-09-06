part of 'contacts_cubit.dart';

enum ContactsStatus {
  initial,
  loading,
  error,
  success,
}

@freezed
class ContactsState with _$ContactsState {
  const factory ContactsState({
    @Default(ContactsStatus.initial) ContactsStatus status,
    final List<ContactsModel>? contacts,
  }) = _ContactsState;
}
