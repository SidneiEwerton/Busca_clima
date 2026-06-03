import 'package:busca_clima2/core/constants/app_strings.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class AppInfoCard extends StatefulWidget {
  const AppInfoCard({super.key});

  @override
  State<AppInfoCard> createState() => _AppInfoCardState();
}

class _AppInfoCardState extends State<AppInfoCard> {
  String _version = '';

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((info) {
      if (mounted)
        setState(() => _version = '${info.version}+${info.buildNumber}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.aboutCard,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 12),
            Text('${AppStrings.versionLabel}: $_version'),
            Text('${AppStrings.developerLabel}: ${AppStrings.developerName}'),
            SizedBox(height: 8),
            InkWell(
              onTap: () =>
                  launchUrl(Uri.parse('mailto:${AppStrings.developerEmail}')),
              child: Text(
                AppStrings.developerEmail,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(height: 4),
            InkWell(
              onTap: () => launchUrl(
                Uri.parse(AppStrings.developerWebsite),
                mode: LaunchMode.externalApplication,
              ),
              child: Text(
                AppStrings.developerWebsite,
                style: const TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
