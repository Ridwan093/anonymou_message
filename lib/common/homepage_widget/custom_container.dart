import 'package:flutter/material.dart';

class Hwidget extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final VoidCallback ontap;
  const Hwidget(
      {super.key,
      required this.title,
      required this.color,
      required this.icon,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(title)
          ],
        )),
      ),
    );
  }
}
