import 'package:flutter/material.dart';
import 'package:rpg/app/theme/app_colors.dart';
import 'package:rpg/app/theme/images.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0,
      // avatar personagem
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.alerta, width: 2),
            ),
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(AppImage.especie_01),
            ),
          ),
        ),
      ),
      scrolledUnderElevation: 0,
      toolbarHeight: preferredSize.height,
      titleSpacing: 0,
      leadingWidth: 76,
      // logo
      title: Image.asset(
        AppImage.logo,
        height: 100,
        width: 200,
        fit: BoxFit.contain,
      ),
    );
  }
}