//profile_section.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:managresguard/constants.dart';
import '../../domain/models/asociado_model.dart';

class ProfileSection extends StatelessWidget {
  final double verticalPos;
  final AssociadoModel associado;
  // Lista de categorías y cantidad de lugares
  final List<Map<String, dynamic>> categories = [
    {'title': 'Assistência 24h', 'places': '-', 'icon': Icons.assist_walker},
    {'title': 'Financiero', 'places': '-', 'icon': Icons.car_rental},
    {'title': 'Fale Conosco', 'places': '-', 'icon': Icons.phone_callback},
    {'title': 'Furto e Roubo', 'places': '-', 'icon': Icons.rocket},
    {'title': 'Oficinas', 'places': '-', 'icon': Icons.link_off},
    {'title': 'Whatsapp', 'places': '-', 'icon': Icons.whatshot},
  ];

  ProfileSection({
    super.key, 
    required this.verticalPos, 
    required this.associado
  });

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: Constants.padding),
            padding: const EdgeInsets.symmetric(horizontal: Constants.padding * 2.5),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 219, 0, 0.6),
              borderRadius: BorderRadius.circular(Constants.radius),
            ),
            child: Stack(
              children: [
                Center(child: buildHeader(context)),
                Opacity(
                  opacity: lerpDouble(0.0, 1.0, verticalPos / MediaQuery.of(context).size.height)!,
                  child: verticalPos > 250
                      ? Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 600),
                                serviceTile(context, "Assistência 24h",
                                    MaterialCommunityIcons.home_assistant),
                                const SizedBox(height: 10),
                                serviceTile(context, "Financiero",
                                    MaterialCommunityIcons.finance),
                                const SizedBox(height: 10),
                                serviceTile(context, "Fale Conosco",
                                    MaterialCommunityIcons.phone_classic),
                                const SizedBox(height: 10),
                                serviceTile(context, "Furto e Roubo",
                                    MaterialCommunityIcons.robber),
                                const SizedBox(height: 10),
                                serviceTile(context, "Whatsapp",
                                    MaterialCommunityIcons.whatsapp),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Añadir la funcionalidad de deslizamiento hacia abajo si es necesario
          },
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.blueGrey.shade800,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget serviceTile(BuildContext context, String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(Constants.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Constants.radius),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () => _showDialog(context, title),
        child: Column(
          children: [
            ListTile(
              leading: Icon(icon, color: Colors.black87, size: 30),
              title: Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Información sobre $title"),
          content: Text(
              "Aquí va más información detallada sobre el servicio de $title."),
          actions: <Widget>[
            TextButton(
              child: const Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildUserAvatar(String image, String name) => Column(
        children: [
          CircleAvatar(
            radius: 30,
            foregroundImage: AssetImage(image),
          ),
          const SizedBox(height: Constants.padding),
          Text(name,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ],
      );

  Row buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: Constants.padding * 2,
              ),
              Text(
                "Oi,",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  // Aquí puedes ajustar el tamaño del texto basado en el tamaño del contenedor
                  double fontSize = constraints.maxWidth > 200 ? 24 : 16;
                  return Text(
                    associado.nome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          width: 75,
          height: 50,
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/image/profile.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => showEditPanel(context),
                  child: const SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.edit, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showEditPanel(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              height: MediaQuery.of(context).size.height * .28,
              margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: SizedBox.expand(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextField(
                            decoration: const InputDecoration(labelText: 'Telefone'),
                            controller: TextEditingController(text: associado.telWhatsapp),
                          ),
                          TextField(
                            decoration: const InputDecoration(labelText: 'Email'),
                            controller: TextEditingController(text: associado.email),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Cierra el dialog
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(255, 219, 0, 1),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Confirmar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          )),
          child: child,
        );
      },
    );
  }
}
