//veiculo_screen.dart
import 'package:flutter/material.dart';
import 'components/veiculo_card.dart';
import 'components/profile_section.dart';
import '../data/data_source/remote/veiculo_api.dart';
import '../data/helpers/http.dart';
import '../data/repositories_empl/veiculo_repository_impl.dart';
import '../domain/repositories/repository.dart';
import '../domain/models/veiculo_model.dart';
import '../domain/models/asociado_model.dart';

class VeiculoScreen extends StatefulWidget {
  final AssociadoModel associado;
  const VeiculoScreen({super.key, required this.associado});

  @override
  _VeiculoScreenState createState() => _VeiculoScreenState();
}

class _VeiculoScreenState extends State<VeiculoScreen> {
  final http = Http(baseUrl: 'https://api-integracao.ileva.com.br');
  late final VeiculoRepository authV = VeiculoRepositoryImpl(VeiculoAPI(http));
  //late Future<Veiculo> futureVeiculo; // Modificado para un solo Veiculo
  late Size size;
  double page = 0.0;
  double verPos = 0.0;
  Duration defaultDuration = const Duration(milliseconds: 300);
  List<VeiculoModel> veiculos = []; // Cambiado a una lista de VeiculoModel

  final PageController _pg = PageController(
    viewportFraction: .8,
    initialPage: 0,
  );

  void pageListener() {
    setState(() {
      page = _pg.page!;
    });
  }

  void onVerticalDrag(DragUpdateDetails details) {
    setState(() {
      verPos += details.primaryDelta!;
      verPos = verPos.clamp(0, double.infinity);
    });
  }

  void onVerticalDragEnds(DragEndDetails details) {
    setState(() {
      if (details.primaryVelocity! > 500 || verPos > size.height / 2) {
        verPos = size.height - 40;
      } else if (details.primaryVelocity! < -500 || verPos < size.height / 2) {
        verPos = 0;
      }
    });
  }

  void onVerticalDrad(DragUpdateDetails details) {
    setState(() {
      verPos += details.primaryDelta!;
      verPos = verPos.clamp(0, double.infinity);
    });
  }

  void onVerticalDradEnds(DragEndDetails details) {
    setState(() {
      if (details.primaryVelocity! > 500 || verPos > size.height / 2) {
        verPos = size.height - 40;
      }
      if (details.primaryVelocity! < -500 || verPos < size.height / 2) {
        verPos = 0;
      }
    });
  }

  Future<void> fetchVeiculos() async {
    try {
      http.token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGllbnRlX25pY2tuYW1lIjoicmVzZ3VhcmQiLCJpZCI6MiwiaGFzaCI6IjE2YzllNGI2Yjk0ZSJ9.ith7n7CDfwgaKt9k0J-D7SXf0v1u9taSrZ3m0HWS0F0';
      
      List<VeiculoModel> tempVeiculos = [];
      
      for (var veiculo in widget.associado.veiculos) {
        final response = await authV.buscar(veiculo.codVeiculo.toString());
        if (response.error == null) {
          tempVeiculos.add(response.data!.veiculo);
        } else {
          //print("Error: ${response.error?.exception}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${response.error?.exception}')),
          );
        }
      }
      
      setState(() {
        veiculos = tempVeiculos;
      });

    } catch (error) {
      //print("Error: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _pg.addListener(pageListener);
    fetchVeiculos();
  }

  @override
  void dispose() {
    _pg.removeListener(pageListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: veiculos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                // Profile Section
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  top: MediaQuery.of(context).padding.top - verPos,
                  left: (size.width * .1 - verPos).clamp(0, double.infinity),
                  right: (size.width * .1 - verPos).clamp(0, double.infinity),
                  bottom: size.height * .75 - verPos,
                  child: AnimatedSwitcher(
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    duration: const Duration(milliseconds: 150),
                    child: GestureDetector(
                      onVerticalDragUpdate: onVerticalDrad,
                      onVerticalDragEnd: onVerticalDradEnds,
                      child: ProfileSection(
                        verticalPos: verPos,
                        associado: widget.associado,
                      ),
                    ),
                  ),
                ),
                // Card veiculo Section
                Positioned(
                  top: (size.height * 0.25) + verPos,
                  bottom: size.height * 0.55 - verPos,
                  left: -5,
                  right: -5,
                  child: PageView(
                    controller: _pg,
                    children: veiculos.map((e) => VeiculoCard(veiculoCard: e)).toList(),
                  ),
                ),
                // Card Detais veiculo Section
                Positioned(
                  top: size.height * .475 + verPos,
                  left: size.width * .09,
                  right: size.width * .1,
                  bottom: 0, // Establece un bottom para permitir expansión hacia abajo
                  child: veiculos.isNotEmpty
                      ? ListView.builder(
                          itemCount: veiculos[page.round()].beneficios.length,
                          itemBuilder: (context, index) {
                            final beneficio = veiculos[page.round()].beneficios[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 11), // Margen para cada elemento
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12), // Padding interno
                              decoration: BoxDecoration(
                                color: Colors.white, // Fondo de cada elemento
                                borderRadius: BorderRadius.circular(10), // Bordes redondeados
                                border: Border.all(color: Colors.grey[300]!), // Borde ligero
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.check_circle, color: Colors.green, size: 24), // Icono
                                  const SizedBox(width: 10), // Espacio entre el icono y el texto
                                  Expanded(
                                    child: Text(
                                      beneficio.beneficio,
                                      style: const TextStyle(
                                        fontSize: 15, // Tamaño de fuente ajustado
                                        fontWeight: FontWeight.bold, // Negrita
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : const Center(child: Text('No benefits available')),
                ),
              ],
            ),
    );
  }
}