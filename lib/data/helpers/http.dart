// http.dart
import 'package:managresguard/data/helpers/http_result.dart';
import 'http_method.dart';
import 'parse_response_body.dart';
import 'send_request.dart';

typedef Parser<T> = T Function(dynamic data);

class Http {
  final String baseUrl;
  String? _token;
  Http({required this.baseUrl, String? token}) : _token = token;
  
  set token(String? token) {
    _token = token;
  }

  Future<HttpResult<T>> request<T>(
    String path, {
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, String> queryParameters = const {},
    dynamic body,
    Parser<T>? parser,
    Duration timeOut = const Duration(seconds: 30),
  }) async {
    int? statusCode;
    dynamic data;
    try {
      late Uri url;
      if (path.startsWith("http://") || path.startsWith("https://")) {
        url = Uri.parse(path);
      } else {
        url = Uri.parse("$baseUrl$path");
      }

      if (queryParameters.isNotEmpty) {
        url = url.replace(queryParameters: {
          ...url.queryParameters,
          ...queryParameters,
        });
      }

      // Agrega el token a los headers si está presente
      final combinedHeaders = {
        ...headers,
        if (_token != null) 'access_token': '$_token',
      };

      final response = await sendRequest(
        url: url,
        method: method,
        headers: combinedHeaders, // Usa combinedHeaders aquí
        body: body,
        timeOut: timeOut,
      );

      // Ajuste para utilizar parseResponseBody
      data = parseResponseBody(response.body);
      statusCode = response.statusCode;
      if (statusCode >= 400) {
        throw HttpError(
          exception: null, 
          stackTrace: StackTrace.current, 
          data: data);
      }

      if (statusCode == 200 && data == null) {
        throw HttpError(
          exception: null, 
          stackTrace: StackTrace.current, 
          data: data);
      }

      // Asegúrate de que el parser se aplique correctamente
      final resultData = parser != null ? parser(data) : data;

      return HttpResult<T>(
        data: resultData,
        statusCode: statusCode,
        error: null,
      );
    } catch (e, s) {
      if (e is HttpError) {
        return HttpResult<T>(
          data: null,
          statusCode: statusCode!,
          error: e,
        );
      }

      return HttpResult<T>(
        data: null,
        error: HttpError(
          data: data,
          exception: e,
          stackTrace: s,
        ),
        statusCode: statusCode ?? -1,
      );
    }
  }
}
