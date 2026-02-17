import 'package:flexibiz/constant/PrefUtils/Prefs.dart';
import 'package:flexibiz/screens/authentication/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'local_database/hive_database_utils/hive_service_init.dart';


void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await HiveServiceInit.init();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flexibiz CRM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}