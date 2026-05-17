import 'package:busca_clima2/core/constants/app_colors.dart';
import 'package:busca_clima2/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class SettingsAppHeader extends StatelessWidget {
  const SettingsAppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Image.asset(
          'assets/images/logo.png',
          height: 72,
          width: 72,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.radar, size: 72, color: AppColors.accent),
        ),
        SizedBox(height: 12),
        Text(
          AppStrings.appTitle,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w300,
            letterSpacing: 1.4,
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
