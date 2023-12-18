import 'package:bloc_app/core/models/response_model.dart';

class AppException implements Exception {
  final ResponseModel response;

  AppException({required this.response});

  @override
  String toString() {
    return response.description!;
  }
}

class FetchDataException extends AppException {
  FetchDataException([message])
      : super(response: ResponseModel(status: "danger", description: message));
}

class BadRequestException extends AppException {
  BadRequestException([message])
      : super(response: ResponseModel(status: "danger", description: message));
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message])
      : super(response: ResponseModel(status: "danger", description: message));
}

class InvalidInputException extends AppException {
  InvalidInputException([message])
      : super(
            response: ResponseModel(
                status: "danger", description: "Doğrulama Hatası"));
}

class TimeOutException extends AppException {
  TimeOutException([message])
      : super(response: ResponseModel(status: "danger", description: message));
}

class NotFoundException extends AppException {
  NotFoundException([message])
      : super(response: ResponseModel(status: "danger", description: message));
}

class ServerErrorException extends AppException {
  ServerErrorException([message])
      : super(response: ResponseModel(status: "danger", description: message));
}

class NetworkException extends AppException {
  NetworkException([message])
      : super(response: ResponseModel(status: "danger", description: message));
}

class DatabaseException extends AppException {
  DatabaseException([message])
      : super(response: ResponseModel(status: "danger", description: message));
}
