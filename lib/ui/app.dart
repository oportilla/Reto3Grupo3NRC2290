import 'package:chat_firebase1/ui/autenticacion/login.dart';
import 'package:chat_firebase1/ui/chat/salachat.dart';
import 'package:chat_firebase1/ui/usuarios/listar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sala de Chat',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: const Login(),
      routes: {
        '/login': (context) => const Login(),
        '/salachat': (context) => const SalaChat(),
        '/listausuarios': (context) => const ListarUsuarios(),
      },
    );
  }
}
