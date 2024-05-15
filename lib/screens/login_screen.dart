import 'package:flutter/material.dart';
import 'package:managresguard/screens/components/input_text.dart';
import 'package:managresguard/utils/dialogs.dart';
import 'package:managresguard/utils/responsive.dart';
import '../data/data_source/remote/authentication_api.dart';
import '../data/helpers/http.dart';
import '../data/repositories_empl/authentication_repository_impl.dart';
import '../domain/repositories/authentication_repository.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _cpf ='', _senha = '';
  final http = Http(baseUrl: 'https://api-integracao.ileva.com.br');
  late final AuthenticacionRepository auth = AuthenticacionRepositoryImpl(AutheticationAPI(http));

  Future<void> _submit() async{
    final isOk = _formKey.currentState?.validate();
    print("form is ok $isOk");
    if (isOk!) {  
      //ProgressDialog.show(context);
      try {
        // Configurar el token manualmente para pruebas
        http.token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGllbnRlX25pY2tuYW1lIjoicmVzZ3VhcmQiLCJpZCI6MiwiaGFzaCI6IjE2YzllNGI2Yjk0ZSJ9.ith7n7CDfwgaKt9k0J-D7SXf0v1u9taSrZ3m0HWS0F0';
        //print("Token configurado: ${http._token}");

        // Muestra un indicador de progreso si es necesario
        // ProgressDialog.show(context);
        
        final response = await auth.login(
          _cpf, 
          _senha, // "cityslicka"
        );
        
        // Maneja la respuesta y actualiza el estado si es necesario
        print(response);
        // Si necesitas actualizar el estado de la UI, usa setState
        setState(() {
          ///_result = response;
          print(response);
        });
        
      } catch (error) {
        // Maneja errores y muestra un mensaje al usuario si es necesario
        print("Error: $error");
        // Muestra un mensaje de error al usuario
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Error: $error')),
        // );
      } finally {
        // Oculta el indicador de progreso si es necesario
        // ProgressDialog.dismiss(context);
      }
    }
    //ProgressDialog.dismiss(context);
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);


    return Positioned(
      bottom: -20,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.istablet ? 430 : 280
        ),
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
                onChanged: (text){
                  print("emal $text");
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
                decoration: BoxDecoration(
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
                          print("password: $text");
                          _senha = text;
                        },
                        validator: (text) {
                          if (text!.trim().length == 0) {
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
                        padding: EdgeInsets.symmetric(
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
              SizedBox(height: responsive.dp(2)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
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
                    "Iniciar Sessão",
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
