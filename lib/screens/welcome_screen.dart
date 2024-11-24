import 'package:explorer/screens/home_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.05),
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/solar_system.png'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: '探\n索\n',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: '太陽系',
                          style: TextStyle(
                            color: Colors.amberAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.amberAccent.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: height * 0.2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
