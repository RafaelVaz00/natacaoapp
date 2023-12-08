import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'RotaLogin.dart';
import 'controller/firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(home: const RotaLogin()));
}
