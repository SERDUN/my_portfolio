enum FailureType { network, unchecked, info, authentication }

abstract class Failure {
  FailureType failureType = FailureType.unchecked;

  FailureType getFailureType() {
    return failureType;
  }

  //This method return all message, server, connections
  String getMessage();
  //This method return error message if it message generated from server
  //else we return null
  String? getDataMessage();

  bool isAvailableErrorData();

  Map<String, String> getData();
}
