import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/gymflow_button.dart';
import '../widgets/gymflow_logo.dart';
import '../widgets/gymflow_text_field.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GymFlowLogo(iconSize: 0, textSize: 20),

                    const SizedBox(height: 32),

                    const Text(
                      'GESTIÓN DE MEMBRESÍA',
                      style: TextStyle(
                        color: AppTheme.accent,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Bienvenido de nuevo',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontSize: 23),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Ingresa para continuar con tu entrenamiento.',
                      style: TextStyle(
                        color: AppTheme.secondaryText,
                        fontSize: 11,
                      ),
                    ),

                    const SizedBox(height: 24),

                    GymFlowTextField(
                      label: 'Correo electrónico',
                      hintText: 'nombre@correo.com',
                      prefixIcon: const Icon(
                        Icons.mail_outline,
                        size: 16,
                        color: AppTheme.secondaryText,
                      ),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        final email = value?.trim() ?? '';

                        if (email.isEmpty) {
                          return 'Ingresa tu correo electrónico';
                        }

                        if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                            .hasMatch(email)) {
                          return 'Ingresa un correo válido';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    GymFlowTextField(
                      label: 'Contraseña',
                      hintText: '••••••••',
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        size: 16,
                        color: AppTheme.secondaryText,
                      ),
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      suffixIcon: IconButton(
                        tooltip: _obscurePassword
                            ? 'Mostrar contraseña'
                            : 'Ocultar contraseña',
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 18,
                          color: AppTheme.secondaryText,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa tu contraseña';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          _showMessage(
                            'La recuperación de contraseña '
                            'se implementará después.',
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppTheme.secondaryText,
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    GymFlowButton(
                      text: 'INICIAR SESIÓN',
                      icon: Icons.arrow_forward,
                      onPressed: _login,
                    ),

                    const SizedBox(height: 22),

                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Text(
                            '¿Aún no tienes cuenta? ',
                            style: TextStyle(
                              color: AppTheme.secondaryText,
                              fontSize: 10,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _showMessage(
                                'El registro se implementará después.',
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: AppTheme.accent,
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'Crear una cuenta',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    Center(
                      child: TextButton.icon(
                        onPressed: () {
                          _showMessage(
                            'El acceso para recepción '
                            'se implementará después.',
                          );
                        },
                        icon: const Icon(Icons.chevron_right, size: 14),
                        label: const Text(
                          'Acceso para recepción',
                          style: TextStyle(fontSize: 10),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: AppTheme.secondaryText,
                          iconAlignment: IconAlignment.end,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
