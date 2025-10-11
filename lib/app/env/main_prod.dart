import 'package:flutter/material.dart';
// app common entry point
import 'package:moorland_fix/main_common.dart';

// flavors
import 'package:moorland_fix/app/flavors/flavor_config.dart';

// services prod
import 'package:moorland_fix/app/env/firebase/firebase_options_prod.dart';

// di
import 'package:moorland_fix/app/injections/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(firebaseOptions: DefaultFirebaseOptions.currentPlatform);
  mainCommon(flavor: Flavor.prod, baseUrl: "http://prod.api.com", name: "Prod");
}