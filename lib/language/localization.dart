import 'package:get/route_manager.dart';
import 'package:udemyecommerce/Utils/my_string.dart';
import 'package:udemyecommerce/language/ar.dart';
import 'package:udemyecommerce/language/en.dart';
import 'package:udemyecommerce/language/fr.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
