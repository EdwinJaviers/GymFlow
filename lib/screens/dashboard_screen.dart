import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/gymflow_logo.dart';
import '../widgets/gymflow_button.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Datos temporales de prueba.
  final String _userName = 'Edwin';
  final int _daysRemaining = 16;
  final int _currentStreak = 12;
  final String _lastVisit = '12 de octubre';
  final String _expirationDate = '28 oct 2026';

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _onNavigationTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        _showMessage('La pantalla de código QR se implementará después.');
        break;
      case 2:
        _showMessage('La pantalla de membresía se implementará después.');
        break;
      case 3:
        _showMessage('La pantalla de perfil se implementará después.');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const GymFlowLogo(iconSize: 0, textSize: 13),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: AppTheme.secondarySurface,
                    child: Text(
                      _userName.isNotEmpty ? _userName[0].toUpperCase() : '?',
                      style: const TextStyle(
                        color: AppTheme.primaryText,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              const Text(
                'LUNES, 12 OCT',
                style: TextStyle(
                  color: AppTheme.accent,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                'Hola, $_userName',
                style: const TextStyle(
                  color: AppTheme.primaryText,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Listo para seguir avanzando.',
                style: TextStyle(color: AppTheme.secondaryText, fontSize: 11),
              ),

              const SizedBox(height: 18),

              // Tarjeta de membresía.
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(13),
                  border: const Border(
                    top: BorderSide(color: AppTheme.accent, width: 1.5),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'MEMBRESÍA MENSUAL',
                                style: TextStyle(
                                  color: AppTheme.secondaryText,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.6,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Color(0xFF35D07F),
                                    size: 6,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'ACTIVA',
                                    style: TextStyle(
                                      color: Color(0xFF35D07F),
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '$_daysRemaining',
                              style: const TextStyle(
                                color: AppTheme.primaryText,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'días restantes',
                              style: TextStyle(
                                color: AppTheme.secondaryText,
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 13),
                    const Divider(color: AppTheme.secondarySurface, height: 1),
                    const SizedBox(height: 11),

                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          color: AppTheme.secondaryText,
                          size: 13,
                        ),
                        const SizedBox(width: 7),
                        const Text(
                          'Vence',
                          style: TextStyle(
                            color: AppTheme.secondaryText,
                            fontSize: 10,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          _expirationDate,
                          style: const TextStyle(
                            color: AppTheme.primaryText,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Tarjetas de actividad.
              Row(
                children: [
                  Expanded(
                    child: _ActivityCard(
                      icon: Icons.local_fire_department_outlined,
                      iconColor: AppTheme.accent,
                      title: 'Racha actual',
                      value: '$_currentStreak días',
                      subtitle: '¡Sigue así!',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _ActivityCard(
                      icon: Icons.access_time,
                      iconColor: AppTheme.secondaryText,
                      title: 'Última visita',
                      value: _lastVisit,
                      subtitle: '8:15 AM',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Acceso al QR.
              GymFlowButton(
                text: 'MOSTRAR MI QR',
                icon: Icons.qr_code_2,
                onPressed: () {
                  _showMessage(
                    'La pantalla de código QR se implementará después.',
                  );
                },
              ),

              const SizedBox(height: 8),

              // Acceso al historial.
              TextButton(
                onPressed: () {
                  _showMessage(
                    'El historial de visitas se implementará después.',
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.secondaryText,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 8,
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.access_time, size: 14),
                    SizedBox(width: 8),
                    Text(
                      'Ver historial de visitas',
                      style: TextStyle(fontSize: 10),
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Navegación inferior.
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppTheme.surface,
          border: Border(
            top: BorderSide(color: AppTheme.secondarySurface, width: 0.7),
          ),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 52,
            child: Row(
              children: [
                _NavigationItem(
                  icon: Icons.home_outlined,
                  label: 'Inicio',
                  selected: _selectedIndex == 0,
                  onTap: () => _onNavigationTap(0),
                ),
                _NavigationItem(
                  icon: Icons.qr_code_2,
                  label: 'QR',
                  selected: _selectedIndex == 1,
                  onTap: () => _onNavigationTap(1),
                ),
                _NavigationItem(
                  icon: Icons.credit_card_outlined,
                  label: 'Membresía',
                  selected: _selectedIndex == 2,
                  onTap: () => _onNavigationTap(2),
                ),
                _NavigationItem(
                  icon: Icons.person_outline,
                  label: 'Perfil',
                  selected: _selectedIndex == 3,
                  onTap: () => _onNavigationTap(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final String subtitle;

  const _ActivityCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 88),
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 23,
            height: 23,
            decoration: BoxDecoration(
              color: AppTheme.secondarySurface,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(icon, color: iconColor, size: 14),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: AppTheme.secondaryText, fontSize: 9),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.primaryText,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            subtitle,
            style: const TextStyle(color: AppTheme.secondaryText, fontSize: 8),
          ),
        ],
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavigationItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 25,
              height: 2,
              color: selected ? AppTheme.accent : Colors.transparent,
            ),
            const Spacer(),
            Icon(
              icon,
              size: 17,
              color: selected ? AppTheme.primaryText : AppTheme.secondaryText,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 8,
                color: selected ? AppTheme.primaryText : AppTheme.secondaryText,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
