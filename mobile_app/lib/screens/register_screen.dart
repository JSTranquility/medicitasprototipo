import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'loading_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  int _currentStep = 0; // 0: Nombre/Correo, 1: Celular, 2: Contraseña
  bool _isLoading = false;

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() => _currentStep++);
    } else {
      _handleRegister();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  void _handleRegister() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isLoading = false);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoadingScreen(
            nextScreen: LoginScreen(),
            message: 'Creando Credenciales...',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryDark = Color(0xFF0B0E14);
    const cardDark = Color(0xFF151923);
    const accentBlue = Color(0xFF00B4D8);
    const stepColor = Color(0xFF00FFD1);

    return Scaffold(
      backgroundColor: primaryDark,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (_currentStep > 0)
                          IconButton(
                            onPressed: _previousStep,
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white70,
                              size: 20,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          )
                        else
                          const Text(
                            'MediCitas',
                            style: TextStyle(
                              color: Color(0xFF00E5FF),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        Row(
                          children: [
                            const Icon(
                              Icons.help_outline,
                              color: Colors.white38,
                              size: 20,
                            ),
                            const SizedBox(width: 16),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.05),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.person_add_outlined,
                                color: Colors.white70,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Título Superior
                    const Text(
                      'AVANT-GARDE WELLNESS',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00FFD1),
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _currentStep == 0
                          ? 'Tus Datos\nBásicos.'
                          : (_currentStep == 1
                                ? 'Contacto y\nSeguridad.'
                                : 'Protege tu\nCuenta.'),
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Cada paso nos acerca a un cuidado clínico más inteligente y personalizado para ti.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Badges
                    _BadgeItem(
                      icon: _currentStep == 0
                          ? Icons.person_outline
                          : (_currentStep == 1
                                ? Icons.phone_android
                                : Icons.lock_outline),
                      title: 'Paso ${_currentStep + 1} de 3',
                      subtitle: _currentStep == 0
                          ? 'Información de identidad.'
                          : (_currentStep == 1
                                ? 'Validación de contacto.'
                                : 'Cifrado de acceso.'),
                    ),
                    const SizedBox(height: 40),

                    // Form Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(28.0),
                      decoration: BoxDecoration(
                        color: cardDark,
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.05),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Crear Cuenta',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _currentStep == 0
                                ? 'Cuéntanos quién eres.'
                                : (_currentStep == 1
                                      ? '¿Cómo podemos contactarte?'
                                      : 'Define tu llave de acceso.'),
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white38,
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Campos Dinámicos
                          if (_currentStep == 0) ...[
                            const _Label('NOMBRE COMPLETO'),
                            _TextField(
                              controller: _nameController,
                              hint: 'Juan Pérez',
                              icon: Icons.person_outline,
                            ),
                            const SizedBox(height: 20),
                            const _Label('DIRECCIÓN DE CORREO'),
                            _TextField(
                              controller: _emailController,
                              hint: 'juan@medicitas.com',
                              icon: Icons.alternate_email,
                            ),
                          ] else if (_currentStep == 1) ...[
                            const _Label('TELÉFONO MÓVIL'),
                            _TextField(
                              controller: _phoneController,
                              hint: '+1 (555) 000-0000',
                              icon: Icons.phone_android_outlined,
                              keyboardType: TextInputType.phone,
                            ),
                          ] else ...[
                            const _Label('CONTRASEÑA SEGURA'),
                            _TextField(
                              controller: _passwordController,
                              hint: '••••••••••••',
                              icon: Icons.lock_outline,
                              isPassword: true,
                            ),
                          ],

                          const SizedBox(height: 32),

                          // Líneas de Progreso
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: _currentStep >= 0
                                        ? stepColor
                                        : Colors.white10,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Container(
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: _currentStep >= 1
                                        ? stepColor
                                        : Colors.white10,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Container(
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: _currentStep >= 2
                                        ? stepColor
                                        : Colors.white10,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),

                          // Botón Continuar / Finalizar
                          Container(
                            width: double.infinity,
                            height: 52,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF0052D4), Color(0xFF00B4D8)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: accentBlue.withOpacity(0.2),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _nextStep,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: _isLoading
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _currentStep == 2
                                              ? 'Completar Registro'
                                              : 'Siguiente Paso',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.arrow_forward,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                            ),
                          ),

                          const SizedBox(height: 32),

                          Center(
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                    (route) => false,
                                  ),
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white38,
                                  ),
                                  children: [
                                    TextSpan(text: '¿Ya tienes una cuenta? '),
                                    TextSpan(
                                      text: 'Inicia sesión aquí',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),

                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: Text(
                          '© 2026 MEDICITAS MEDICINE SANCTUARY • v4.5',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.white24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BadgeItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _BadgeItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF00FFD1), size: 18),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white38, fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white60,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;
  const _TextField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 14, color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white12, fontSize: 14),
        fillColor: const Color(0xFF0B0E14),
        filled: true,
        prefixIcon: Icon(icon, color: Colors.white24, size: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }
}
