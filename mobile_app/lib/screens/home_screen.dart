import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryDark = Color(0xFF0B0E14);
    const cardDark = Color(0xFF151923);
    const accentBlue = Color(0xFF00B4D8);

    return Scaffold(
      backgroundColor: primaryDark,
      body: Stack(
        children: [
          // 1. Contenido principal con Scroll
          Positioned.fill(
            child: SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 150),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Color(0xFF0052D4), Color(0xFF00B4D8)],
                                ),
                              ),
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: cardDark,
                                child: Icon(Icons.person, color: Colors.white, size: 20),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'MediCitas',
                              style: TextStyle(
                                color: Color(0xFF00E5FF),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.notifications_outlined, color: Colors.white70),
                      ],
                    ),
                    const SizedBox(height: 32),

                    const Text(
                      'Hola de nuevo,\nAlex',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'ESTADO DEL SISTEMA: ÓPTIMO',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: accentBlue.withOpacity(0.6),
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Tarjeta Principal
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: cardDark,
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: Colors.white.withOpacity(0.05)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'PRÓXIMO TURNO',
                                style: TextStyle(
                                  color: accentBlue,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              Icon(Icons.more_horiz, color: Colors.white38),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Cardiología Clínica',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Dra. Elena Rodriguez — 09:30 AM',
                            style: TextStyle(fontSize: 14, color: Colors.white60),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: accentBlue,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                  ),
                                  child: const Text('Realizar Check-in', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: const Icon(Icons.calendar_month, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Título Sección
                    const Text(
                      'Servicios Digitales',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          _VerticalService(icon: Icons.videocam, label: 'Telemedicina', color: const Color(0xFFE57373)),
                          _VerticalService(icon: Icons.medication, label: 'Recetas', color: const Color(0xFFFFB74D)),
                          _VerticalService(icon: Icons.biotech, label: 'Laboratorio', color: const Color(0xFF81C784)),
                          _VerticalService(icon: Icons.history, label: 'Historial', color: const Color(0xFF64B5F6)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Banner Promocional
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0052D4), Color(0xFF4364F7), Color(0xFF6FB1FC)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Plan de Salud Familiar',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Protege a los que más quieres con cobertura total.',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            child: const Text('Explorar Planes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          
          // 2. Barra de Navegación Flotante Unificada
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1F2430),
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Items de navegación (4 iniciales)
                      const Expanded(child: _BottomNavItem(icon: Icons.grid_view, label: 'Inicio', isActive: true)),
                      const Expanded(child: _BottomNavItem(icon: Icons.calendar_month, label: 'Agenda')),
                      const Expanded(child: _BottomNavItem(icon: Icons.favorite_border, label: 'Salud')),
                      const Expanded(child: _BottomNavItem(icon: Icons.person_outline, label: 'Perfil')),
                      
                      // El botón de "+" dentro de la misma barra
                      Container(
                        width: 54,
                        height: 54,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0052D4), Color(0xFF00E5FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(27),
                          boxShadow: [
                            BoxShadow(
                              color: accentBlue.withOpacity(0.4),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.add, color: Colors.white, size: 28),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VerticalService extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _VerticalService({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF151923),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.02)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 12),
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _BottomNavItem({required this.icon, required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    final color = isActive ? const Color(0xFF00E5FF) : Colors.white38;
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(color: color, fontSize: 8, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
