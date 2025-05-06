class CustomException implements Exception {
  CustomException([this._message, this._prefix, this.statusCode]);

  final dynamic _message;
  final dynamic _prefix;
  final int? statusCode;

  dynamic get message => _message;
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message, int? statusCode])
      : super(message, "Error During Communication: ", statusCode);
}

class NoInternetException extends CustomException {
  NoInternetException([String? message, int? statusCode])
      : super(message, "No Internet Connection", statusCode);
}

class BadRequestException extends CustomException {
  BadRequestException([String? message, int? statusCode])
      : super(message, "Invalid Request", statusCode);
}

class ResourceNotFoundException extends CustomException {
  ResourceNotFoundException([String? message, int? statusCode])
      : super(message, "Resource not found.Error code  404", statusCode);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([String? message, int? statusCode])
      : super(message, "Unauthorised", statusCode);
}

class InternalServerErrorException extends CustomException {
  InternalServerErrorException([String? message, int? statusCode])
      : super(message, "Internal Server error", statusCode);
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message, int? statusCode])
      : super(message, "Invalid Input", statusCode);
}

class CustomServerException extends CustomException {
  CustomServerException([String? message, int? statusCode])
      : super(
            message,
            "Feature not currently available. Please check back again",
            statusCode);
}

class SessionExpireErrorException extends CustomException {
  SessionExpireErrorException()
      : super("Session Expire error", "Session Expire error", 401);
}
