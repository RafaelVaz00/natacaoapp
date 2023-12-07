import 'package:flutter/material.dart';
import 'package:natacaoapp/controller/AdministradorController.dart';
import 'package:natacaoapp/view/shared/layouts/Home.dart';
import 'package:natacaoapp/controller/LoginController.dart';
import 'package:email_validator/email_validator.dart';

import 'RotaLogin.dart';
import 'model/Usuario.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  loginController.iniciarFireBase();
  runApp(MaterialApp(home: const RotaLogin()));
}
