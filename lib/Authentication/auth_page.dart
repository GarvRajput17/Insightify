import 'package:flutter/material.dart';
import 'package:newsightsai/main.dart';
import 'package:newsightsai/screens/HomePage.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  // We define the controllers here for handling animations
  // late initialisation
  late AnimationController _logoTextAnimationController;
  // double to handle the duration of the animation in seconds
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;

  @override
  // We use the initState method to initialize the controllers
  void initState() {
    // Super used to call the parent class's initState method
    super.initState();

    // Logo and text animation controllers
    _logoTextAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 5),);
    _logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _logoTextAnimationController, curve: Curves.easeInOut)
    );

    _textAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.2)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 40.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.2, end: 1.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 60.0,
      ),
    ]).animate(_logoTextAnimationController);
    // Start the animation (logo first)
    _logoTextAnimationController.forward().whenComplete(() {
      // we will add firebase checks here later
      //
      //
      //
      //

      //Directly routing right now
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });

    // Usage of tween animations
  }
  // closing the initState method
  @override
  void dispose() {
    // Dispose of the animation controllers
    _logoTextAnimationController.dispose();
    super.dispose();
  }

  // Main build method
  @override
  Widget build(BuildContext context) {
    // Using media query to get the screen size
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _logoAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _logoAnimation.value,
                  child: Transform.scale(
                    scale: _logoAnimation.value,
                    //child: Image.asset('lib/SVGs/logo/logo.png'),
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            AnimatedBuilder(
              animation: _textAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _textAnimation.value,
                  child: Text(
                    'AI POWERED NEWS APP',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                  ),
                );
              },
            ),

            const SizedBox(height: 5),

            AnimatedBuilder(
              animation: _textAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _textAnimation.value,
                  child: Text(
                    'CURATED AS PER YOUR INTERESTS',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            AnimatedBuilder(animation: _textAnimation, builder: (context, child) {
              return Opacity(opacity: _textAnimation.value,
                  child: Text(
                    'POWERED BY WEFIT',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.grey),
                  )
              );
            })
          ],
        ),
      ),
    );
  }
}
