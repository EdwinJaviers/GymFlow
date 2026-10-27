import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class GymFlowLogo extends StatelessWidget {
  final double iconSize;
  final double textSize;
  final bool showTagline;

  const GymFlowLogo({
    super.key,
    this.iconSize = 42,
    this.textSize = 20,
    this.showTagline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.rotate(
              angle: -0.12,
              child: Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  color: AppTheme.accent,
                  borderRadius: BorderRadius.circular(iconSize * 0.28),
                ),
                alignment: Alignment.center,
                child: Text(
                  'G',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: iconSize * 0.57,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.7,
                ),
                children: const [
                  TextSpan(
                    text: 'GYM',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'FLOW',
                    style: TextStyle(color: AppTheme.accent),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (showTagline) ...[
          const SizedBox(height: 8),
          const Text(
            'Tu gimnasio. Tu ritmo.',
            style: TextStyle(color: AppTheme.secondaryText, fontSize: 10),
          ),
        ],
      ],
    );
  }
}
