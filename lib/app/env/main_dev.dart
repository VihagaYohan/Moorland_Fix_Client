import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// app common entry point
import 'package:moorland_fix/main_common.dart';

// flavors
import 'package:moorland_fix/app/flavors/flavor_config.dart';

// firebase dev
import 'package:moorland_fix/app/env/firebase/firebase_options_dev.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  mainCommon(flavor: Flavor.dev, baseUrl: "http://dev.api.com", name: "Dev");
}