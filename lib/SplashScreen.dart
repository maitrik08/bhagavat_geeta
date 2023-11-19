import 'package:bhagavat_geeta/HomeScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5),() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
    },);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('aseets/bhagvat_geeta.jpg',fit: BoxFit.cover,height: double.infinity,width: double.infinity,),
    );
  }
}
