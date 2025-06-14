import 'package:flutter/material.dart';

class Boton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color colorbtn;
  final Color colortxt;

  const Boton({
    super.key,
    required this.text,
    required this.onPressed,
    this.colorbtn = const Color(0xFF4CAF50),
    this.colortxt = const Color.fromARGB(230, 0, 0, 0),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 50),
        foregroundColor: colortxt,
        backgroundColor: colorbtn,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 1),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
          color: colortxt,
        ),
      ),
    );
  }
}
