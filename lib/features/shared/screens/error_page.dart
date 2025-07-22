import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Ruta Inexistente',
          style: textStyle.titleLarge
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/error_icon.png',
              width: 185,
              height: 214,
            ),
            const Text('Página no encontrada',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
            Text('Por favor, comunicate con el administrador de la aplicación.',
            style: textStyle.bodyMedium
            ),
            GestureDetector(
              onTap: () => context.go('/'),
              child: const Text(
                'Regresar a Home',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}