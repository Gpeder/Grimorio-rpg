import 'package:flutter/material.dart';
import 'package:rpg/app/theme/app_colors.dart';

class CharacterStat extends StatelessWidget {
  const CharacterStat({super.key, 
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.progress,
    this.centered = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final double? progress;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              centered ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 19),
            const SizedBox(width: 5),
            Text(
              label,
              style: text.labelMedium?.copyWith(color: AppColors.darkSecondary),
            ),
          ],
        ),
        const SizedBox(height: 5),
        if (progress == null)
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: text.bodyLarge?.copyWith(color: AppColors.darkOnSurface),
            ),
          )
        else
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
                  color: color,
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