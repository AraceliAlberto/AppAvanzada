import 'package:flutter/material.dart';
import 'package:eco_avanzado/pantallas/distribucion.dart';

class sueldoPantalla extends StatefulWidget {
  const sueldoPantalla({super.key});

  @override
  State<sueldoPantalla> createState() => _sueldoPantallaState();
}

class _sueldoPantallaState extends State<sueldoPantalla> {
  final sueldoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // ----------------- inicio degradado -----------------
      body: Container(
        // ----------------- findegradado -----------------
        // ----------------- widget normales del container  -----------------
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ----------------- imagen de fondo  -----------------
                Image.asset('assets/img/pantalla_home.png', height: 250),
                SizedBox(height: 23),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Economía ',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      TextSpan(
                        text: 'Ideal',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF06D6A0),
                          letterSpacing: 1.2,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: const Color.fromRGBO(105, 240, 174, 1),
                              offset: Offset(0, 0),
                            ),
                          ], // acento verde
                        ),
                      ),
                    ],
                  ),
                ),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'La fórmula ',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(237, 255, 255, 255),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      TextSpan(
                        text: '50/30/20',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF00B4D8), // azul celeste
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // ----------------- introducir datos  -----------------
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Sueldo:",
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(215, 226, 226, 226),
                      letterSpacing: 1.2,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(196, 221, 255, 1),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 19,
                    color: Color.fromARGB(235, 245, 245, 245),
                    letterSpacing: 1.2,
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 7,
                  controller: sueldoController,
                ),
                const SizedBox(height: 20),
                // ----------------- BOTÓN -----------------
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    backgroundColor: const Color.fromRGBO(105, 240, 174, 1),
                    elevation: 6,
                    shadowColor: const Color.fromARGB(115, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  onPressed: () {
                    String sueldo = sueldoController.text;
                    if (sueldo.isEmpty) {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text('Campo Vacío'),
                              content: const Text(
                                'Por favor ingresa tu sueldo antes de continuar',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => distribucionPantalla(sueldo: sueldo),
                      ),
                    );
                  },
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // ----------------- FIN DE LOS WIDGETS -----------------
      ),
      // ----------------- FIN DEL DEGRADADO -----------------
    );
  }
}
