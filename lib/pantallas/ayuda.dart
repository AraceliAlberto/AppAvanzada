import 'package:flutter/material.dart';

class AyudaPantalla extends StatelessWidget {
  const AyudaPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ayuda',
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1.2,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Color.fromARGB(200, 17, 31, 17),
        foregroundColor: Colors.white,
        toolbarHeight: 70,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 226, 226),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 122, 122, 122),
              blurRadius: 20,
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
                'Pantalla de inicio:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 61, 50, 50),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Aquí debes ingresar tu sueldo o ingreso mensual. Una vez introducido, presiona el botón "Continuar" para usar ese monto en los cálculos de la app.',
                style: TextStyle(
                  color: Color.fromARGB(255, 33, 31, 31),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Pantalla de inicio:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 61, 50, 50),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Al ingresar a esta pantalla por primera vez, aparecerá una alerta recordándote la importancia de ahorrar cada mes según la regla del 50/30/20.\n\n'
                'Tabla dividida en tres columnas:\n\n'
                '• Monto estático: Muestra el valor asignado a cada categoría (50%, 30% y 20%).\n'
                '• Categoría: Indica a qué tipo de gasto corresponde ese monto (necesidades, deseos o ahorro).\n'
                '• Ícono con botón: Al presionarlo, puedes acceder a la lista detallada de gastos dentro de esa categoría, donde podrás añadir, visualizar o eliminar elementos.\n\n',
                style: TextStyle(
                  color: Color.fromARGB(255, 33, 31, 31),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Gráfica de Pie:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 39, 37, 37),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'La gráfica de torta te ayuda a visualizar fácilmente cómo se reparte tu ingreso entre las tres categorías de la regla 50/30/20. Es una forma clara y rápida de ver en qué estás gastando.',
                style: TextStyle(
                  color: Color.fromARGB(255, 32, 30, 30),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Boton (ojo) y listas:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 11, 10, 10),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Los botones te permiten agregar diferentes tipos de gastos según cada categoría. Al agregar un gasto, este se muestra en una lista detallada. Si excedes el límite permitido, aparecerá una alerta.\n\n'
                'Además, puedes eliminar cualquier gasto manteniendo pulsado sobre él, y el monto se ajustará automáticamente en la gráfica.',
                style: TextStyle(
                  color: Color.fromARGB(255, 46, 42, 42),
                  fontSize: 16,
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
