import 'package:flutter/material.dart';
import 'package:rpg/app/theme/app_colors.dart';

class Divider_hor extends StatelessWidget {
  const new({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    const gold = AppColors.darkSecondary;

    return Container(
      width: 1,
      height: 58,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: gold.withValues(alpha: 0.4),
    );
  }
}