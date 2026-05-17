import 'dart:ui';

import 'package:busca_clima2/core/constants/app_colors.dart';
import 'package:busca_clima2/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.white10,
            border: Border(
              bottom: BorderSide(color: AppColors.white20, width: 0.5),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: AppColors.white90,
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.radar, color: AppColors.accent, size: 22),
                        SizedBox(width: 10),
                        Text(
                          AppStrings.appTitle,
                          style: TextStyle(
                            color: AppColors.white90,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
