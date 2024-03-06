import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://project2.amit-learning.com/api/';

  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> register(
      {required String endPoint, required Map<String, dynamic> data}) async {
    final response = await _dio.post(
      _baseUrl + endPoint,
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getJobs(
      {required String endPoint, String? bearerToken}) async {
    final response = await _dio.get(
      _baseUrl + endPoint,
      options: Options(
        headers: {
          if (bearerToken != null) 'Authorization': 'Bearer $bearerToken',
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> searchJobsApiService(
      {required String endPoint,
      required Map<String, dynamic> data,
      String? bearerToken}) async {
    final response = await _dio.post(
      _baseUrl + endPoint,
      data: data,
      options: Options(
        headers: {
          if (bearerToken != null) 'Authorization': 'Bearer $bearerToken',
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getJobByIdApiService({
    required String endPoint,
    String? bearerToken,
  }) async {
    String fullPath = _baseUrl + endPoint;
    final response = await _dio.get(
      fullPath,
      options: Options(
        headers: {
          if (bearerToken != null) 'Authorization': 'Bearer $bearerToken',
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> addToFavApiService(
      {required String endPoint,
      required Map<String, dynamic> data,
      String? bearerToken}) async {
    final response = await _dio.post(
      _baseUrl + endPoint,
      data: data,
      options: Options(
        headers: {
          if (bearerToken != null) 'Authorization': 'Bearer $bearerToken',
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getAllFavsApiService(
      {required String endPoint,
      String? bearerToken,
      required Map<String, dynamic> data}) async {
    final response = await _dio.get(
      _baseUrl + endPoint,
      data: data,
      options: Options(
        headers: {
          if (bearerToken != null) 'Authorization': 'Bearer $bearerToken',
        },
      ),
    );
    return response.data;
  }
}
