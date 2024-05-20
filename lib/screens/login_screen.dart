//login_screen.dart
import 'package:flutter/material.dart';
import 'package:managresguard/screens/components/input_text.dart';
import 'package:managresguard/utils/dialogs.dart';
import 'package:managresguard/utils/responsive.dart';
import '../data/data_source/remote/associado_api.dart';
import '../data/helpers/http.dart';
import '../data/helpers/http_result.dart';
import '../data/repositories_empl/associado_repository_impl.dart';
import '../domain/models/asociado_model.dart';
import '../domain/repositories/repository.dart';
import 'inicio_screen.dart';
import 'veiculo_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _cpf = '', _senha = '';
  final http = Http(baseUrl: 'https://api-integracao.ileva.com.br');
  late final AssociadoRepository auth = AssociadoRepositoryImpl(AssociadoAPI(http));
  bool _isLoading = false;

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      {
        try {
          // Configurar el token manualmente para pruebas
          http.token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGllbnRlX25pY2tuYW1lIjoicmVzZ3VhcmQiLCJpZCI6MiwiaGFzaCI6IjE2YzllNGI2Yjk0ZSJ9.ith7n7CDfwgaKt9k0J-D7SXf0v1u9taSrZ3m0HWS0F0';

          // Muestra un indicador de progreso si es necesario
          //ProgressDialog.show(context);

          final HttpResult<ApiResponse> response = await auth.login(_cpf, _senha);

          // Maneja la respuesta y actualiza el estado si es necesario
          if (response.error == null && response.data != null) {
            final associado = response.data!.associado;

            // Verificar que el objeto associado no es null
            if (associado.nome.isNotEmpty) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => VeiculoScreen(associado: associado),
                  settings: RouteSettings(arguments: associado),
                ),
              );
            } else {
              _showErrorSnackBar("CPF ou senha estão incorretos");
            }
          } else {
            _showErrorSnackBar("CPF ou senha estão incorretos");
          }
        } catch (e) {
          print('$e');
          _showErrorSnackBar("CPF/CPNJ ou senha estão incorretos");
        } finally {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    _formKey.currentState?.reset();
    setState(() {
      _cpf = '';
      _senha = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: -20,
      child: Container(
        constraints: BoxConstraints(maxWidth: responsive.istablet ? 430 : 280),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputText(
                keyboardtype: TextInputType.number,
                fontsize: responsive.dp(responsive.istablet ? 1.2 : 1.4),
                label: "CPF",
                color: Colors.white,
                labelcolor: Colors.white,
                onChanged: (text) {
                  _cpf = text;
                },
                /* validator: (text){
                  if (text!.contains("@")) {
                    return "vpf invalido";
                  }
                  return 'null';
                },*/
              ),
              SizedBox(height: responsive.dp(2)),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InputText(
                        label: "SENHA",
                        color: Colors.white,
                        labelcolor: Colors.white,
                        keyboardtype: TextInputType.url,
                        obscuretext: true,
                        borderenabled: false,
                        fontsize: responsive.dp(1.4),
                        onChanged: (text) {
                          _senha = text;
                        },
                        validator: (text) {
                          if (text!.trim().isEmpty) {
                            return "senha invalida";
                          }
                          return null;
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Tu código aquí
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black38,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10), // Color del texto
                      ),
                      child: Text(
                        'Esqueci Senha',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: responsive.dp(1.5),
                          color: Colors.white60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Versão 1.10.0Beta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: responsive.dp(1.2),
                ),
              ),
              SizedBox(height: responsive.dp(2)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submit,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(255, 219, 0, 1)), // Cambia el color del botón a azul
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ), // Da un borde redondeado al botón
                      ),
                    ),
                  ),
                  child: Text(
                    _isLoading ? 'Iniciando...' : 'Iniciar Sessão',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: responsive.dp(10)),
              
            ],
          ),
        ),
        
      ),
    );
  }
}
