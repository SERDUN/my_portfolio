import 'failure.dart';

class DefaultFailure extends Failure {
  static String noInternetConnectionMessage(message) => "$message";

  static String somethingHappenedMessage(message) =>
      "Something happened: $message";

  static String tokenExpiredMessage(message) => "TokenExpired: $message";

  static get parseErrorMessage => "Parse failure";

  final String message;
  final Map<String, String>? data;

  DefaultFailure(this.message,
      {this.data, FailureType type = FailureType.unchecked}) {
    failureType = type;
  }

  @override
  String getMessage() {
    return message;
  }

  @override
  Map<String, String> getData() {
    return data ?? {};
  }

  @override
  bool isAvailableErrorData() {
    return getData().isNotEmpty;
  }

  //If we can translate this message locally we return null
  @override
  String? getDataMessage() {
    return (failureType == FailureType.unchecked ||
            failureType == FailureType.network)
        ? null
        : getMessage();
  }
}
