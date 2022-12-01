import 'package:chat_firebase1/domain/controlador/controluser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nu = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passw = TextEditingController();
  ControlAuth ca = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Chat-GR3'),
              const SizedBox(
                height: 10,
              ),
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.message_sharp,
                  size: 50,
                ),
              ),
              TextField(
                controller: nu,
                decoration:
                    const InputDecoration(labelText: 'Ingresar el Nombre'),
              ),
              TextField(
                controller: email,
                decoration:
                    const InputDecoration(labelText: 'Ingresar el Email'),
              ),
              TextField(
                controller: passw,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Ingrese la Contraseña'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                     
                      onPressed: () {
                        ca.ingresarEmail(email.text, passw.text).then((value) {
                          if (ca.emailr != "") {
                            Get.offAllNamed('/listausuarios');
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'Validacion de Usuarios',
                              message: 'Usuario o Contraseña Invalidos',
                              icon: Icon(Icons.warning),
                              duration: Duration(seconds: 5),
                              backgroundColor: Colors.green,
                            ));
                          }
                        }).catchError((e) {
                          Get.showSnackbar(GetSnackBar(
                            title: 'Validacion de Usuarios',
                            message: '$e',
                            icon: const Icon(Icons.warning),
                            duration: const Duration(seconds: 5),
                            backgroundColor: Colors.blue,
                          ));
                        });
                      },
                      
                      child: const Text('Ingresar')),
                  OutlinedButton(
                      onPressed: () {
                        if (nu.text!=""){
                        ca
                            .addUser(email.text, passw.text, nu.text)
                            .then((value) {
                          if (ca.emailr != "") {
                            Get.offAllNamed('/listausuarios');
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'Validacion de Usuarios',
                              message: 'Usuario o Contraseña Invalidos',
                              icon: Icon(Icons.warning),
                              duration: Duration(seconds: 5),
                              backgroundColor: Colors.blue,
                            ));
                          }
                        }).catchError((e) {
                          Get.showSnackbar(GetSnackBar(
                            title: 'Validacion de Usuarios',
                            message: '$e',
                            icon: const Icon(Icons.warning),
                            duration: const Duration(seconds: 5),
                            backgroundColor: Colors.blue,
                          ));
                        });
                      } else{
                        Get.showSnackbar(const GetSnackBar(
                              title: 'Validacion de Usuarios',
                              message: 'Nombre requerido',
                              icon: Icon(Icons.warning),
                              duration: Duration(seconds: 5),
                              backgroundColor: Colors.blue,
                            ));

                      }
                      },
                      child: const Text('Registrarse'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
