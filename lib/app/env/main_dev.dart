import 'package:moorland_fix/main_common.dart';

// flavors
import 'package:moorland_fix/app/flavors/flavor_config.dart';

void main() {
  mainCommon(flavor: Flavor.dev, baseUrl: "http://dev.api.com", name: "Dev");
}