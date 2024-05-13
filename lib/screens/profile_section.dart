import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:managresguard/constants.dart';

class ProfileSection extends StatelessWidget {
  ProfileSection({
    super.key,
    required this.verticalPos,
  });

  final double verticalPos;
  // Lista de categorías y cantidad de lugares
  final List<Map<String, dynamic>> categories = [
    {'title': 'Assistência 24h', 'places': '-', 'icon': Icons.assist_walker},
    {'title': 'Financiero', 'places': '-', 'icon': Icons.car_rental},
    {'title': 'Fale Conosco', 'places': '-', 'icon': Icons.phone_callback},
    {'title': 'Furto e Roubo', 'places': '-', 'icon': Icons.rocket},
    {'title': 'Oficinas', 'places': '-', 'icon': Icons.link_off},
    {'title': 'Whatsapp', 'places': '-', 'icon': Icons.whatshot},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: Constants.padding),
            padding:
                const EdgeInsets.symmetric(horizontal: Constants.padding * 2.5),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 219, 0, 0.6),
              borderRadius: BorderRadius.circular(Constants.radius),
            ),
            child: Stack(
              children: [
                Center(child: buildHeader(context)),
                Opacity(
                  opacity: lerpDouble(0.0, 1.0,
                      verticalPos / MediaQuery.of(context).size.height)!,
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
                      : null,
                )
              ],
            ),
          ),
        ),
        Container(
          height: 5,
          width: 50,
          margin: const EdgeInsets.symmetric(vertical: Constants.padding),
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade800,
            borderRadius: BorderRadius.circular(Constants.radius),
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
        RichText(
          text: TextSpan(
            text: "Oi,",
            style: Theme.of(context).textTheme.headlineSmall,
            children: const [
              TextSpan(
                text: " Bruno",
                style: TextStyle(fontWeight: FontWeight.bold),
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
                  bottomRight: Radius.circular(40)
                ),
              ), // Ajusta la altura según necesites
              child: SizedBox.expand(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const TextField(
                            decoration: InputDecoration(labelText: 'Nombre'),
                          ),
                          const TextField(
                            decoration: InputDecoration(labelText: 'Apellido'),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Cierra el dialog
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(255, 219, 0, 1)), // Cambia el color del botón a azul
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                  ), // Da un borde redondeado al botón
                                ),
                              ),
                            ),
                            child: const Text(
                              'Guardar Cambios',
                              style: TextStyle(
                                  color: Colors.white), // Cambia el color de la letra a blanco
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
