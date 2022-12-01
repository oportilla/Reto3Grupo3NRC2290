import 'package:chat_firebase1/domain/controlador/controladduser.dart';
import 'package:chat_firebase1/domain/controlador/controlchat.dart';
import 'package:chat_firebase1/domain/controlador/controluser.dart';
import 'package:chat_firebase1/ui/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetPlatform.isWeb?
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyDu9ENu05n4rBmO6zsI2eR8OJcgOlPp7ZY",
    authDomain: "chatfirebase-1917d.firebaseapp.com",
    projectId: "chatfirebase-1917d",
    storageBucket: "chatfirebase-1917d.appspot.com",
    messagingSenderId: "151936803231",
    appId: "1:151936803231:web:660eb5d108164419f81daa")

  ):
  await Firebase.initializeApp();
 
  Get.put(ControlChat());
  Get.put(ControlAuth());
  Get.put(ControlAddUser());
  
  runApp(const App());
}

