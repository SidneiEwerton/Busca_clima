import 'package:busca_clima2/core/constants/app_colors.dart';
import 'package:flutter/material.dart';



class CustomSnackbar {
  CustomSnackbar._();  


static void show(
  BuildContext context,
  String mensage, {
  bool isError = false,
}) {

  final messenger = ScaffoldMessenger.of(context);
  messenger.hideCurrentSnackBar();

  messenger.showSnackBar(
    SnackBar(
      backgroundColor: isError ? Colors.red.shade900 : AppColors.white10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isError ? Colors.red : AppColors.accent,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 4),
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: AppColors.white90,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              mensage,
              style: const TextStyle(color: AppColors.white90, fontSize: 14),
            ),
          ),
        ],
      ),
    ),
  );
}
}