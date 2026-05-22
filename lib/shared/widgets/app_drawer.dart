import 'package:busca_clima2/core/constants/app_colors.dart';
import 'package:busca_clima2/core/constants/app_strings.dart';
import 'package:busca_clima2/features/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 56,
                    width: 56,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.radar,
                      size: 56,
                      color: AppColors.accent,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    AppStrings.appTitle,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(AppStrings.start),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings_applications),
              title: Text(AppStrings.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
