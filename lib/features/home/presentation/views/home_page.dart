import 'package:flutter/material.dart';
import 'package:rpg/app/theme/app_colors.dart';
import 'package:rpg/app/theme/images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    const appBar = AppBarHome();
    final toolbarHeight = appBar.preferredSize.height;
    final topInset = MediaQuery.paddingOf(context).top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 110 + toolbarHeight + topInset,
              padding: EdgeInsets.fromLTRB(
                20,
                toolbarHeight + topInset + 20,
                20,
                20,
              ),
              alignment: Alignment.bottomLeft,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImage.fundo_bg),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color(0x60000000),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem-vindo de volta!',
                    style: text.bodyLarge?.copyWith(
                      color: AppColors.alerta,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Aventureiro!',
                    style: text.headlineMedium?.copyWith(
                      color: AppColors.alerta,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
      leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.alerta,
                  width: 2,
                ),
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
      title: Image.asset(
        AppImage.logo,
        height: 100,
        width: 200,
        fit: BoxFit.contain,
      ),
      actions: [
        
      ],
    );
  }
}
