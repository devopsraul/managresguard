// inicio_page.dart
import 'package:flutter/material.dart';
import '../domain/models/asociado_model.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  late AssociadoModel associado;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Obtener el objeto associado desde los argumentos
    associado = ModalRoute.of(context)!.settings.arguments as AssociadoModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inicio")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nome: ${associado.nome}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("CPF: ${associado.cpf}", style: TextStyle(fontSize: 16)),
            Text("Email: ${associado.email}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text("Veículos:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: associado.veiculos.length,
                itemBuilder: (context, index) {
                  final veiculo = associado.veiculos[index];
                  return ListTile(
                    title: Text(veiculo.modelo, style: TextStyle(fontSize: 16)),
                    subtitle: Text("Placa: ${veiculo.placa}", style: TextStyle(fontSize: 14)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
