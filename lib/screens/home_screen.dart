import 'package:explorer/screens/planet_detail_screen.dart';
import 'package:explorer/widgets/curved_dotted_line.dart';
import 'package:explorer/data/planets_data.dart';
import 'package:explorer/widgets/planet_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      int newIndex = pageController.page?.round() ?? 0;
      if (newIndex != currentIndex) {
        setState(() {
          currentIndex = newIndex;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center),
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.069),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: '歡迎你們\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                      children: [
                        TextSpan(
                            text: '凱凱、硯硯！',
                            style: TextStyle(fontWeight: FontWeight.normal))
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.2,
                    height: width * 0.2,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/superman.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.3,
            child: SizedBox(
              width: width,
              height: height,
              child: PageView.builder(
                controller: pageController,
                itemCount: planetsData.length,
                itemBuilder: (context, index) {
                  return PlanetContainer(
                      imagePath: planetsData[index].imagePath,
                      planetName: planetsData[index].planetName,
                      nickname: planetsData[index].nickname,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => PlanetDetailScreen(
                              planetsData: planetsData[index],
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          ),
          Positioned(
              top: height * 0.2,
              child: RepaintBoundary(
                child: CustomPaint(
                  size: Size(width, height * 0.1),
                  painter: CurvedLineWithDotsPainter(
                      numDots: planetsData.length, currentIndex: currentIndex),
                ),
              ))
        ],
      ),
    );
  }
}
