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
    try {
      final result = await _http.request<VeiculoResponse>(
        '/veiculo/buscar',
        queryParameters: {
          "cod_veiculo": codVeiculo
        },
        method: HttpMethod.get,
        parser: (data) {
          return VeiculoResponse.fromJson(data);
        },
        //timeOut: Duration(seconds: 30), // Agregar un timeout de 30 segundos
      );

      if (result.error == null) {
        //print("result data ${result.data}");
        //print("result statusCode ${result.statusCode}");
        return HttpResult<VeiculoResponse>(
          data: result.data,
          statusCode: result.statusCode,
          error: null,
        );
      } else {
        print("result error ${result.error?.exception}");
        print("result error ${result.error?.stackTrace}");
        print("result statusCode ${result.statusCode}");
        return HttpResult<VeiculoResponse>(
          data: null,
          statusCode: result.statusCode,
          error: result.error,
        );
      }
    } on SocketException catch (e) {
      return HttpResult<VeiculoResponse>(
        data: null,
        statusCode: 500,
        error: HttpError(
          data: null,
          exception: Exception('Network Error'),
          stackTrace: StackTrace.current,
        ),
      );
    } on TimeoutException catch (e) {
      return HttpResult<VeiculoResponse>(
        data: null,
        statusCode: 500,
        error: HttpError(
          data: null,
          exception: Exception('Timeout Error'),
          stackTrace: StackTrace.current,
        ),
      );
    } catch (e) {
      return HttpResult<VeiculoResponse>(
        data: null,
        statusCode: 500,
        error: HttpError(
          data: null,
          exception: Exception('Unknown Error'),
          stackTrace: StackTrace.current,
        ),
      );
    }
  }
}
