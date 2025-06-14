import 'package:flutter/material.dart';

class TotalCaja extends StatelessWidget {
  final String encabezado;
  final String monto;
  final bool mostrarOjo;
  final VoidCallback? onVerDetalle;

  const TotalCaja({
    super.key,
    required this.encabezado,
    required this.monto,
    required this.mostrarOjo,
    this.onVerDetalle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              encabezado,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Text(
            monto,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 3,
            ),
          ),
          SizedBox(width: 50),
          if (mostrarOjo)
            IconButton(
              icon: const Icon(
                Icons.remove_red_eye,
                color: Color.fromARGB(255, 136, 214, 156),
              ),
              onPressed: onVerDetalle,
            ),
        ],
      ),
    );
  }
}
