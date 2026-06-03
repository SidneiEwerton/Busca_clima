import 'package:busca_clima2/core/constants/app_strings.dart';
import 'package:busca_clima2/features/settings/presentation/widgets/app_info_card.dart';
import 'package:busca_clima2/features/settings/presentation/widgets/settings_app_header.dart';
import 'package:busca_clima2/features/settings/presentation/widgets/theme_selector_card.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.settings)),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          SettingsAppHeader(),
          ThemeSelectorCard(),
          SizedBox(height: 8),
          AppInfoCard(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
