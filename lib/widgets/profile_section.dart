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
    {
      'title': 'Assistência 24h',
      'places': '-',
      'icon': Icons.assist_walker
    },
    {
      'title': 'Financiero',
      'places': '-',
      'icon': Icons.car_rental
    },
    {
      'title': 'Fale Conosco',
      'places': '-',
      'icon': Icons.phone_callback
    },
    {
      'title': 'Furto e Roubo',
      'places': '-',
      'icon': Icons.rocket
    },
    {
      'title': 'Oficinas',
      'places': '-',
      'icon': Icons.link_off
    },
    {
      'title': 'Whatsapp',
      'places': '-',
      'icon': Icons.whatshot
    },
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
                  opacity: lerpDouble(0.0, 1.0, verticalPos / MediaQuery.of(context).size.height)!,
                  child: verticalPos > 250
                      ? Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 600),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            color: Colors.white,
                                          ),
                                          child: const Icon(Icons.search,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                            height: Constants.padding),
                                        const Text(
                                          "Search",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    //buildUserAvatar('assets/image/user1.png', "Alexa"),
                                    //buildUserAvatar('assets/image/user2.png', "Aldo"),
                                    //buildUserAvatar('assets/image/user3.png', "John"),
                                  ],
                                ),
                                const SizedBox(height: Constants.padding * 2),
                                // Container for pay services expanded
                                Container(
                                  padding: const EdgeInsets.all(Constants.padding),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Constants.radius),
                                    color: Colors.white,
                                  ),
                                  child: const Column(
                                    children: [
                                      ListTile(
                                        leading: Icon(
                                          MaterialCommunityIcons.home_assistant,
                                          color: Colors.black87, 
                                          size: 30
                                        ),
                                        title: Text(
                                          "Assistência 24h",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          )
                                        ),
                                      ),
                                      // Repetir o expandir elementos adicionales aquí si es necesario
                                      ListTile(
                                        leading: Icon(MaterialCommunityIcons.finance,
                                            color: Colors.black87, size: 30),
                                        title: Text("Financiero",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      ListTile(
                                        leading: Icon(MaterialCommunityIcons.phone_classic,
                                            color: Colors.black87, size: 30),
                                        title: Text("Fale Conosco",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      ListTile(
                                        leading: Icon(MaterialCommunityIcons.robber,
                                            color: Colors.black87, size: 30),
                                        title: Text("Furto e Roubo",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      ListTile(
                                        leading: Icon(MaterialCommunityIcons.office_building,
                                            color: Colors.black87, size: 30),
                                        title: Text("Oficinas",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      ListTile(
                                        leading: Icon(MaterialCommunityIcons.whatsapp,
                                            color: Colors.black87, size: 30),
                                        title: Text("Whatsapp",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      //ListTile(
                                      //  leading: Icon(Icons.money_rounded,
                                      //      color: Colors.black87, size: 30),
                                      //  title: Text("Take a loan",
                                      //      style: TextStyle(
                                      //          fontWeight: FontWeight.bold)),
                                      //  trailing: Chip(label: Text("4%")),
                                      //),
                                      Padding(
                                        padding:
                                            EdgeInsets.all(Constants.padding),
                                        child: Icon(
                                          Icons.more_horiz,
                                          size: 30,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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

  Widget buildUserAvatar(String image, String name) => Column(
        children: [
          CircleAvatar(
            radius: 30,
            foregroundImage: AssetImage(image),
          ),
          const SizedBox(
            height: Constants.padding
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.w500
            )
          ),
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
                  style: TextStyle(fontWeight: FontWeight.bold)),
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
                child: Container(
                  width: 50,
                  height: 50,
                  child: const Icon(Icons.edit, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
