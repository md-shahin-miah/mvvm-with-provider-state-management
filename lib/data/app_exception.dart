class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_message$_prefix";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "Error Fetching Data");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super([message, "Invalid Request"]);
}

class UnAuthorizedException extends AppException{
  UnAuthorizedException([String? message]):super(message,"UnAuthorised request");
}

class InValidInputException extends AppException {


  InValidInputException([String? message]):super(message,"Invalid Input!");
}