import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_covid_19_tracker/screens/world_states_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
  AnimationController(duration: Duration(seconds: 3), vsync: this)
    ..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>const WorldStatesScreen())));
  }
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                child: Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Center(child: Image(image: AssetImage("assets/virus.png"))),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * pi,
                    child: child,
                  );
                }),
            SizedBox(height: MediaQuery.of(context).size.height*.06),
            Center(
              child: Text(
                "Covid-19\nTracker App",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
