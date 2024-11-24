import 'package:flutter/material.dart';

class PlanetDetailItem extends StatelessWidget {
  const PlanetDetailItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.value});

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(height * 0.1),
      ),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.025,
          ),
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: width * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
