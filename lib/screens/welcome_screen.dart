import 'package:flutter/material.dart';
import 'package:gymflow/widgets/gymflow_button.dart';
import 'package:gymflow/widgets/gymflow_logo.dart';

import '../theme/app_theme.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            children: [
              const Spacer(flex: 3),

              const GymFlowLogo(iconSize: 42, textSize: 20, showTagline: true),

              const Spacer(flex: 4),

              GymFlowButton(
                text: 'COMENZAR',
                icon: Icons.arrow_forward,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
