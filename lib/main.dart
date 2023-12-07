import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:natacaoapp/controller/AdministradorController.dart';
import 'package:natacaoapp/view/shared/layouts/Home.dart';
import 'package:natacaoapp/controller/LoginController.dart';
import 'package:email_validator/email_validator.dart';

import 'RotaLogin.dart';
import 'controller/firebase_options.dart';
import 'model/Usuario.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(home: const RotaLogin()));
}
