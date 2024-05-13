import 'package:flutter/material.dart';
import 'package:managresguard/screens/components/input_text.dart';
import 'package:managresguard/utils/responsive.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginScreen> {

  GlobalKey<FormState> _formKey = GlobalKey();
  String _cpf ='', _senha = '';

  _submit(){
    final isOk = _formKey.currentState?.validate();
    //if (isOk){ }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);


    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.istablet ? 430 : 300
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputText(
                keyboardtype: TextInputType.number,            
                fontsize: responsive.dp(responsive.istablet ? 1.2 : 1.4),
                label: "CPF",
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
                          return '';
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
                        'Esqueci Minha Senha',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: responsive.dp(1.5),
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
                          bottomRight: Radius.circular(
                            10
                          )
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
