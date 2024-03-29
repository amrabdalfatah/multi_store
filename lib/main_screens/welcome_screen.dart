import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multi_store/main_screens/supplier_home.dart';
import 'package:multi_store/widgets/teal_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const textColors = [
  Colors.tealAccent,
  Colors.red,
  Colors.blueAccent,
  Colors.green,
  Colors.purple
];

const textStyles = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.bold,
  fontFamily: 'Acme',
);

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/inapp/bgimage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'WELCOME',
                    textStyle: textStyles,
                    colors: textColors,
                  ),
                  ColorizeAnimatedText(
                    'Duck Store',
                    textStyle: textStyles,
                    colors: textColors,
                  ),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
              const SizedBox(
                height: 120,
                width: 200,
                child: Image(image: AssetImage('images/inapp/logo.jpg')),
              ),
              SizedBox(
                height: 80,
                child: DefaultTextStyle(
                  style: textStyles,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('BUY'),
                      RotateAnimatedText('SHOP'),
                      RotateAnimatedText('DUCK STORE'),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: const Text(
                          'Supplier only',
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.tealAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedLogo(controller: _controller),
                            TealButton(
                              label: 'Log In',
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                  '/supplier_home',
                                );
                              },
                              width: 0.25,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TealButton(
                                  label: 'Sign Up',
                                  onPressed: () {},
                                  width: 0.25),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TealButton(
                            label: 'Sign Up',
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/customer_signup');
                            },
                            width: 0.25,
                          ),
                        ),
                        TealButton(
                          label: 'Log In',
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(
                              '/customer_home',
                            );
                          },
                          width: 0.25,
                        ),
                        AnimatedLogo(controller: _controller),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration:
                    BoxDecoration(color: Colors.white38.withOpacity(0.3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GoogleFacebookLogin(
                      label: 'Google',
                      onPressed: () {},
                      child: const Image(
                          image: AssetImage('images/inapp/google.jpg')),
                    ),
                    GoogleFacebookLogin(
                      label: 'Facebook',
                      onPressed: () {},
                      child: const Image(
                          image: AssetImage('images/inapp/facebook.jpg')),
                    ),
                    GoogleFacebookLogin(
                      label: 'Guest',
                      onPressed: () {},
                      child: const Icon(
                        Icons.person,
                        size: 55,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    Key? key,
    required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: child,
        );
      },
      child: const Image(image: AssetImage('images/inapp/logo.jpg')),
    );
  }
}

class GoogleFacebookLogin extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Widget child;
  const GoogleFacebookLogin({
    Key? key,
    required this.child,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: child,
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
