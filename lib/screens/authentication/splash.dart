import 'package:flexibiz/constant/PrefUtils/PrefUtils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/screens/authentication/login/url_Login.dart';
import 'package:flexibiz/screens/dashboard/dasbard_one.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  void _checkLogin() async {
    await Future.delayed(const Duration(milliseconds: 800));

    if (PrefUtils.isUserLoggedIn()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardOne())
          //Dashboard
        //RoughDashboard
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const UrlLogin()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagesUtils.splash),
              fit: BoxFit.fill
          ),
        ),
      ),
    );
  }
}
