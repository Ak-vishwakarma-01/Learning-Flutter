import 'package:flutter/material.dart';

class ForeCastCard extends StatelessWidget {
  const ForeCastCard({
    super.key,
    required this.temp,
    required this.icon,
    required this.time,
  });
  
  final String temp;
  final String time;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: const Color.fromARGB(255, 52, 43, 43),
      child:  ClipRect(
        // it is used to apply border radius property and it clip it
        clipBehavior: Clip.hardEdge, // border radius
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: 170,
              child: Column(
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Icon(
                    icon,
                    size: 50,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    temp,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
