import 'package:flutter/material.dart';
import 'package:rpg/app/theme/app_colors.dart';

class CardText extends StatelessWidget {
  final String texts;
  const CardText({super.key, required this.texts});

  @override
  Widget build(BuildContext context) {
    final border = Border.all(color: AppColors.alerta, width: 1.5);
    final text = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.vida.withValues(alpha: 0.2),
        border: border,
        borderRadius: BorderRadius.circular(4),
      ),
      // nível personagem
      child: Text(
        texts,
        style: text.titleSmall?.copyWith(color: AppColors.alerta),
      ),
    );
  }
}