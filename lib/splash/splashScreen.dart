import 'package:coin_lore/home/home.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }
  _navigateToHome()async{
    await Future.delayed(Duration(milliseconds: 1500), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/cl_logo.png'),
    );
  }
}
