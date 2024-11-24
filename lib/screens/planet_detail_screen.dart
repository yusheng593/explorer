import 'dart:ui';

import 'package:explorer/data/planets_data.dart';
import 'package:explorer/widgets/planet_detail_item.dart';
import 'package:flutter/material.dart';

class PlanetDetailScreen extends StatelessWidget {
  const PlanetDetailScreen({super.key, required this.planetsData});

  final PlanetsData planetsData;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Text(
                    planetsData.planetName,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    planetsData.nickname,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: height * 0.3,
                        width: width,
                        child: Image.asset(
                          'assets/images/${planetsData.imagePath}',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        top: height * 0.02,
                        right: width * 0.2,
                        child: ClipOval(
                          child: Container(
                            height: height * 0.1,
                            width: height * 0.1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(0.2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.thermostat,
                                  color: Colors.white,
                                ),
                                Text(
                                  planetsData.temperature,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '與地球的距離',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.blueGrey.withOpacity(0.8),
                    ),
                  ),
                  Text(
                    planetsData.distanceToEarth,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.public, color: Colors.blueGrey),
                      SizedBox(
                        width: width * 0.032,
                      ),
                      const Icon(Icons.rocket_launch, color: Colors.blueGrey),
                      const Text(
                        '-------------------',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 25),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(width * 0.06),
                    child: Column(
                      children: [
                        PlanetDetailItem(
                            icon: Icons.speed,
                            title: '平均軌道速度',
                            value: planetsData.averageOrbitalSpeed),
                        const SizedBox(height: 16),
                        PlanetDetailItem(
                            icon: Icons.satellite_alt,
                            title: '發射衛星數量',
                            value: planetsData.satellitesSent.toString()),
                        const SizedBox(height: 16),
                        PlanetDetailItem(
                            icon: Icons.architecture_sharp,
                            title: '表面積',
                            value: planetsData.surfaceArea),
                        const SizedBox(height: 16),
                        PlanetDetailItem(
                            icon: Icons.rotate_right_outlined,
                            title: '自轉週期',
                            value: '${planetsData.rotationPeriod} 地球日'),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
