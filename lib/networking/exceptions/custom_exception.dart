class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return '_message: $_message, _prefix: $_prefix}';
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String message])
      : super(message, "Error during communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([String message]) : super(message, "Invalid request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}
