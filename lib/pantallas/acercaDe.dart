import 'package:flutter/material.dart';

class AcercadePantalla extends StatefulWidget {
  const AcercadePantalla({super.key});

  @override
  State<AcercadePantalla> createState() => _AcercadePantallaState();
}

class _AcercadePantallaState extends State<AcercadePantalla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(200, 17, 31, 17),
        foregroundColor: Colors.white,
        toolbarHeight: 70,
        title: const Text(
          'Acerca de la Aplicacion',
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1.2,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(199, 197, 197, 197),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 122, 122, 122),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(color: Colors.white10),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '¿Qué es la regla 50/30/20?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 49, 68, 51),
                ),
              ),
              SizedBox(height: 10),
              Text(
                """La regla 50/30/20 es una forma simple y práctica de organizar tus finanzas personales. Consiste en dividir tus ingresos mensuales en tres grandes categorías:
                    \n- 50% para necesidades básicas.
                    \n- 30% para gustos y estilo de vida.
                    \n- 20% para ahorro o pago de deudas.
                    \nEste método es ampliamente utilizado por personas que desean controlar sus gastos sin complicarse con contabilidades complejas. Te permite tomar decisiones más conscientes sobre cómo usas tu dinero cada mes.""",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 59, 59, 59),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),

              Text(
                '¿Cómo aplicar la regla 50/30/20?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 49, 68, 51),
                ),
              ),
              SizedBox(height: 10),

              Text(
                '- 50% para necesidades básicas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 112, 136, 110),
                ),
              ),
              SizedBox(height: 10),
              Text(
                """La mitad de tus ingresos debe cubrir los gastos esenciales, es decir, aquellos que no puedes evitar y que son necesarios para tu día a día. Por ejemplo:
                    \n- Alquiler o pago de vivienda.
                    \n- Servicios como luz, agua, gas, internet.
                    \n- Alimentación básica del hogar.
                    \n- Transporte (como pasajes o combustible).
                    \nEstos gastos son fundamentales y deben ser tu prioridad al momento de distribuir tu dinero.""",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 59, 59, 59),
                  height: 1.5,
                ),
              ),

              SizedBox(height: 10),
              Text(
                '- 30% para deseos o estilo de vida',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 112, 136, 110),
                ),
              ),
              SizedBox(height: 10),
              Text(
                """Este porcentaje está destinado a cubrir tus gustos personales, es decir, gastos que no son esenciales pero que mejoran tu calidad de vida. Algunos ejemplos incluyen:
                    \n- Salidas a comer o al cine.
                    \n- Compras de ropa o accesorios.
                    \n- Actividades recreativas u ocio.
                    \nEs importante no sobrepasar este 30%, ya que mantener el equilibrio evita endeudamientos innecesarios.""",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 59, 59, 59),
                  height: 1.5,
                ),
              ),

              SizedBox(height: 10),
              Text(
                '- 20% para ahorro y deudas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 112, 136, 110),
                ),
              ),
              SizedBox(height: 10),
              Text(
                """El último 20% debe destinarse a tu futuro financiero. Ya sea para ahorrar, invertir o pagar deudas pendientes, este dinero es clave para mantener estabilidad y afrontar imprevistos. Por ejemplo:
                    \n- Crear un fondo de emergencia.
                    \n- Ahorrar para metas importantes.
                    \n- Abonar a préstamos o tarjetas de crédito.
                    \nEste hábito fortalece tu salud financiera y te prepara para cualquier eventualidad.""",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 59, 59, 59),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
