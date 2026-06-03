import 'package:busca_clima2/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

// class LoadingOverlay extends StatelessWidget {
//   const LoadingOverlay({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Expanded(
//       child: Center(child: CircularProgressIndicator(color: AppColors.accent)),
//     );
//   }
// }




class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 80),
        child: CircularProgressIndicator(color: AppColors.accent),
      ),
    );
  }
}