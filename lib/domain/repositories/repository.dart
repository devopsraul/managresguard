//repository.dart
import '../../data/helpers/http_result.dart';
import '../models/asociado_model.dart';
import '../models/veiculo_model.dart';
import '../responses/login_response.dart';

abstract class AssociadoRepository {
  Future<String?> get accesToken;
  Future<HttpResult<ApiResponse>> login(String email, String password);
}

abstract class VeiculoRepository {
  Future<String?> get accesToken;
  Future<HttpResult<VeiculoResponse>> buscar(String codVeiculo);
}