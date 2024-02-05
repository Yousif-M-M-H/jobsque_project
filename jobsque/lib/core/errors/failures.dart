import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Time Out');

      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Time Out');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recieve Time Out');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.cancel:
        return ServerFailure('Canceled');
      case DioExceptionType.unknown:
        return ServerFailure('There\'s an error');
      case DioExceptionType.badResponse:
        return ServerFailure.fromStatusCode(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
    }
  }
  factory ServerFailure.fromStatusCode(int statusCode, dynamic response) {
    if (statusCode == 400) {
      if (response is Map<String, dynamic> &&
          response.containsKey('massege') &&
          response['massege'] is Map<String, dynamic>) {
        Map<String, dynamic> message = response['massege'];
        if (message.containsKey('email')) {
          return ServerFailure(message['email'][0]);
        }
      }
      return ServerFailure('Bad request');
    } else if (statusCode == 401) {}
    return ServerFailure('Unhandled server error');
  }
}
