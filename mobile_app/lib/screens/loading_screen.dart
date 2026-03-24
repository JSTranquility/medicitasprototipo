import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  final Widget nextScreen;
  final String message;

  const LoadingScreen({
    super.key, 
    required this.nextScreen, 
    this.message = 'Sincronizando Sistemas...'
  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Salto automático a la siguiente pantalla después de 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => widget.nextScreen,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryDark = Color(0xFF0B0E14);
    const accentBlue = Color(0xFF00FFD1);

    return Scaffold(
      backgroundColor: primaryDark,
      body: Stack(
        children: [
          // Sutil resplandor de fondo
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    accentBlue.withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _pulseAnimation,
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: accentBlue.withOpacity(0.1),
                          blurRadius: 50,
                          spreadRadius: 10,
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                
                // Indicador de progreso estilizado
                SizedBox(
                  width: 180,
                  child: Column(
                    children: [
                      Text(
                        widget.message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      LinearProgressIndicator(
                        backgroundColor: Colors.white10,
                        valueColor: const AlwaysStoppedAnimation<Color>(accentBlue),
                        minHeight: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Texto inferior decorativo
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 54),
              child: Text(
                'PROTOCOLO E.N.C.R.I.P.T.A.D.O',
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.white24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
