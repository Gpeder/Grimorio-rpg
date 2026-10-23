import 'package:flutter/material.dart';
import 'package:rpg/app/theme/app_colors.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        border: Border.all(color: AppColors.alerta, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.alerta, width: 0.5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: child,
      ),
    );
  }
}
