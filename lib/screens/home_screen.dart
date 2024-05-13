import 'package:flutter/material.dart';
import 'package:managresguard/screens/login_screen.dart';
import 'package:managresguard/utils/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double pinksize = responsive.wp(80);
    final double orangesize = responsive.wp(57);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    top: pinksize * .35,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: responsive.dp(2),
                        ),
                        Text(
                          "Oi, Bem Vindo",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: responsive.dp(1.5)),
                        ),
                      ],
                    )),
                LoginScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
