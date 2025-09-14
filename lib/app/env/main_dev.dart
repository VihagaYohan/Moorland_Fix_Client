import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// app common entry point
import 'package:moorland_fix/main_common.dart';

// flavors
import 'package:moorland_fix/app/flavors/flavor_config.dart';

// services dev
import 'package:moorland_fix/app/env/firebase/firebase_options_dev.dart';

// di
import 'package:moorland_fix/app/injections/injection_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
/*  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );*/
  await di.init(firebaseOptions: DefaultFirebaseOptions.currentPlatform);
  mainCommon(flavor: Flavor.dev, baseUrl: "http://dev.api.com", name: "Dev");
}