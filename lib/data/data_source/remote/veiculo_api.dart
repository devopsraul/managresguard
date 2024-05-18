import 'dart:async';
import 'dart:io';
import '../../../domain/models/veiculo_model.dart';
import '../../helpers/http.dart';
import '../../helpers/http_method.dart';
import '../../helpers/http_result.dart';

class VeiculoAPI {
  final Http _http;
  late final error;
  VeiculoAPI(this._http);

  Future<HttpResult<VeiculoResponse>> buscar(String codVeiculo) async {
    final result = await _http.request<VeiculoResponse>(
      '/veiculo/buscar',
      queryParameters: {
        "cod_veiculo": codVeiculo
      },
      method: HttpMethod.get,
      parser: (data) {
        return VeiculoResponse.fromJson(data);
      },
    );

    error = result.error?.exception;

    print("result data ${result.data}");
    print("result data runtimeType ${result.data.runtimeType}");
    print("result error ${result.error?.exception}");
    print("result error ${result.error?.stackTrace}");
    print("result statusCode ${result.statusCode}");

    if (result.error == null) {
      return HttpResult<VeiculoResponse>(
        data: result.data,
        statusCode: result.statusCode,
        error: null,
      );
    }
    if (result.statusCode == 400) {
      return HttpResult<VeiculoResponse>(
        data: null,
        statusCode: result.statusCode,
        error: HttpError(
          data: result.data,
          exception: Exception('Access Denied'),
          stackTrace: StackTrace.current,
        ),
      );
    }

    if (error is SocketException || error is TimeoutException) {
      return HttpResult<VeiculoResponse>(
        data: null,
        statusCode: result.statusCode,
        error: HttpError(
          data: result.data,
          exception: Exception('Network Error'),
          stackTrace: StackTrace.current,
        ),
      );
    }

    return HttpResult<VeiculoResponse>(
      data: null,
      statusCode: result.statusCode,
      error: HttpError(
        data: result.data,
        exception: Exception('Unknown Error'),
        stackTrace: StackTrace.current,
      ),
    );
  }
}
