import 'package:flutter/material.dart';
import 'package:managresguard/data/helpers/http.dart';
import 'package:managresguard/domain/repositories/authentication_repository.dart';
import 'data/data_source/remote/authentication_api.dart';
import 'data/repositories_empl/authentication_repository_impl.dart';
import 'screens/home_screen.dart'; // Asegúrate de ajustar la ruta si es necesario

void main() {

  runApp(const MyApp());
  //runApp(TmpPage());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ResGuard App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class TmpPage extends StatefulWidget {
  const TmpPage({Key? key}) : super(key: key);

  @override
  _TmpPageState createState() => _TmpPageState();
}

class _TmpPageState extends State<TmpPage> {
  @override
  void initState() {
    super.initState();

    final http = Http(baseUrl: 'https://reqres.in');

    final AuthenticacionRepository auth = AuthenticacionRepositoryImpl(
      AutheticationAPI(http)
    );

    auth
        .login(
          "eve.holt@reqres.in",
          "cityslicka",
        )
        .then(
          (value) => print(value),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
