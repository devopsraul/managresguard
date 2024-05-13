import 'package:flutter/material.dart';
import 'package:managresguard/domain/models/bank_card_model.dart';
import 'package:managresguard/screens/components/bank_card.dart';
import 'package:managresguard/screens/profile_section.dart';

class VeiculoScreen extends StatefulWidget {
  const VeiculoScreen({super.key});

  @override
  _VeiculoScreenState createState() => _VeiculoScreenState();
}

class _VeiculoScreenState extends State<VeiculoScreen> {
  final PageController _pg = PageController(
    viewportFraction: .8,
    initialPage: 0,
  );

  double page = 0.0;

  late Size size;
  double verPos = 0.0;
  Duration defaultDuration = const Duration(milliseconds: 300);

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

  @override
  void initState() {
    _pg.addListener(pageListener);
    super.initState();
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
      body: Stack(
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
              children: cards.map((e) => BankCard(bankCard: e)).toList(),
            ),
          ),
          // Card Detais veiculo Section
          Positioned(
            top: size.height * .475 + verPos,
            left: size.width * .09,
            right: size.width * .1,
            bottom: 0, // Establece un bottom para permitir expansión hacia abajo
            child: ListView.builder(
              itemCount: cards[page.round()].beneficios.length,
              itemBuilder: (context, index) {
                final expense = cards[page.round()].beneficios[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal:11
                  ), // Margen para cada elemento
                  padding: const EdgeInsets.symmetric(
                    vertical: 10, 
                    horizontal: 12
                  ), // Padding interno
                  decoration: BoxDecoration(
                    color: Colors.white, // Fondo de cada elemento
                    borderRadius: BorderRadius.circular(10), // Bordes redondeados
                    border: Border.all(color: Colors.grey[300]!), // Borde ligero
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle,
                          color: Colors.green, size: 24), // Icono
                      const SizedBox(
                          width: 10), // Espacio entre el icono y el texto
                      Expanded(
                        child: Text(
                          expense.title,
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
            ),
          ),
        ],
      ),
    );
  }
}
