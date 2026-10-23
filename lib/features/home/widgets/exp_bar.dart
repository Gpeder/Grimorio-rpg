import 'package:flutter/material.dart';
import 'package:rpg/app/theme/app_colors.dart';

class CharacterExp extends StatelessWidget {
  const CharacterExp({super.key, required this.value, required this.progress});

  final String value;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.auto_awesome_outlined,
              color: AppColors.exp,
              size: 19,
            ),
            const SizedBox(width: 5),
            Text(
              'XP',
              style: text.labelMedium?.copyWith(color: AppColors.darkSecondary),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 24,
          foregroundDecoration: BoxDecoration(
            border: Border.all(color: AppColors.alerta, width: 1.5),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              LinearProgressIndicator(
                value: progress,
                color: AppColors.exp,
                backgroundColor: AppColors.darkSurface,
                borderRadius: BorderRadius.circular(4),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: text.labelMedium?.copyWith(
                        color: AppColors.darkOnSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
