
import 'package:dio/dio.dart';
import 'package:newpro/weathermodel.dart';

class Weatherservice {
  final Dio _dio = Dio();
  final String _baseurl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = '5b72335a76d5ac44cf771f014a8d5055';

  Future<Weather> fetchWeather(String city) async {
    try {
      final response = await _dio.get(_baseurl, queryParameters: {
        'q': city,  
        'appid': apiKey,
        'units': 'metric',
      });
      if (response.statusCode == 200) {
        return Weather.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather');
      }
    } catch (err) {
      if (err is DioException) {
        throw errorfromDio.handleError(err);
      }
      print(err);
      rethrow;
    }
  }
}

abstract class errors {
  var messages;
  errors(this.messages);
}

class errorfromDio extends errors {
  errorfromDio(super.messages);

  factory errorfromDio.handleError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return errorfromDio("Request to API server was canceled.");
      case DioExceptionType.sendTimeout:
        return errorfromDio("Connection timeout with API server.");
      case DioExceptionType.receiveTimeout:
        return errorfromDio("Receive timeout in connection with API server.");
      case DioExceptionType.unknown:
        return errorfromDio("Connection to API server failed due to internet connection.");
      case DioExceptionType.badResponse:
        return errorfromDio("Received invalid status code ${dioError.response?.statusCode}");
      default:
        return errorfromDio("Something went wrong.");
    }
  }
}
