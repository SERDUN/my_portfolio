abstract class InfoEvent {}

class GetUserEvent extends InfoEvent {
  final String? locale;

  GetUserEvent(this.locale);
}
