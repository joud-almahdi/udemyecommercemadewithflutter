//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemyecommerce/Logic/Controllers/themecontroller.dart';
import 'package:udemyecommerce/Routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:udemyecommerce/Utils/theme.dart';
import 'Logic/Controllers/maincontroller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>("auth") == true
          ? AppRoutes.mainscreen
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
