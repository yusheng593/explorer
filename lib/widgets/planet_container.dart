import 'package:flutter/material.dart';

class PlanetContainer extends StatefulWidget {
  const PlanetContainer(
      {super.key,
      required this.imagePath,
      required this.planetName,
      required this.nickname,
      required this.onTap});

  final String imagePath;
  final String planetName;
  final String nickname;
  final Function() onTap;

  @override
  State<PlanetContainer> createState() => _PlanetContainerState();
}

class _PlanetContainerState extends State<PlanetContainer> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Text(
              widget.planetName,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              widget.nickname,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/${widget.imagePath}',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
