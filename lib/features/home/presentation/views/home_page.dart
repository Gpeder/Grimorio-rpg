import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rpg/app/router/app_routes.dart';
import 'package:rpg/app/theme/app_colors.dart';
import 'package:rpg/app/theme/images.dart';
import 'package:rpg/core/widgets/app_card.dart';
import 'package:rpg/features/home/widgets/character_stats.dart';
import 'package:rpg/features/home/widgets/divider_vert.dart';
import 'package:rpg/features/home/widgets/exp_bar.dart';

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
            Image_bg(toolbarHeight: toolbarHeight, topInset: topInset, text: text),

            // cartão personagem
            const Padding(
              // Aproxima o card do cabeçalho, mantendo as margens laterais.
              padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: ActiveCharacterCard(),
            ),
          ],
        ),
      ),
    );
  }
}

class Image_bg extends StatelessWidget {
  const new({
    super.key,
    required this.toolbarHeight,
    required this.topInset,
    required this.text,
  });

  final double toolbarHeight;
  final double topInset;
  final TextTheme text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110 + toolbarHeight + topInset,
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
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.35, 0.7, 1],
            colors: [
              Theme.of(context).scaffoldBackgroundColor
                  .withValues(alpha: 0),
              Theme.of(context).scaffoldBackgroundColor
                  .withValues(alpha: 0.45),
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(
          20,
          toolbarHeight + topInset + 20,
          20,
          20,
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
      actions: [],
    );
  }
}

class ActiveCharacterCard extends StatelessWidget {
  const ActiveCharacterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    const gold = AppColors.darkSecondary;
    final border = Border.all(color: AppColors.alerta, width: 1.5);
    // imagem personagem
    final portrait = Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        border: border,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        AppImage.especie_01,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.none,
      ),
    );

    // atributos personagem
    final stats = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // vida personagem
        const Expanded(
          flex: 3,
          child: CharacterStat(
            icon: Icons.favorite,
            label: 'HP',
            value: '38 / 38',
            color: AppColors.vida,
            progress: 1,
          ),
        ),
        Divider_hor(),
        // armadura personagem
        const Expanded(
          flex: 2,
          child: CharacterStat(
            icon: Icons.shield_outlined,
            label: 'CA',
            value: '16',
            color: gold,
            centered: true,
          ),
        ),
        Divider_hor(),
        // mana personagem
        const Expanded(
          flex: 3,
          child: CharacterStat(
            icon: Icons.bolt_outlined,
            label: 'Mana',
            value: '1.250 / 2.000',
            color: AppColors.mana,
            progress: 0.625,
          ),
        ),
      ],
    );
    final identity = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // nome personagem
        Text(
          'Elyndra',
          style: text.headlineMedium?.copyWith(
            color: AppColors.darkOnSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // classe personagem
            Text(
              'Clériga',
              style: text.bodyMedium?.copyWith(color: AppColors.alerta),
            ),
            const SizedBox(height: 12),
            CardText(texts: 'Nível 5'),
          ],
        ),

        const SizedBox(height: 6),
        // experiência personagem
        const CharacterExp(value: '1.250 / 2.000', progress: 0.625),
      ],
    );

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // cartão personagem ativo
              CardText(texts: 'Pesonagem Ativa'),

              // botão detalhes personagem
              TextButton(
                onPressed: () => context.pushNamed(
                  AppRoutes.characterDetailsName,
                  pathParameters: {'id': 'elyndra'},
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  foregroundColor: AppColors.alerta,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('detalhes'),
                    SizedBox(width: 4),
                    Icon(Icons.chevron_right, size: 18),
                  ],
                ),
              ),
            ],
          ),
          // Menos espaço entre o título do card e a foto do personagem.
          const SizedBox(height: 6),
          // layout responsivo
          LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 500;
              final details = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  identity,
                  if (!compact) ...[
                    // Divisor mais próximo do XP e dos atributos.
                    const SizedBox(height: 4),
                    Divider(
                      height: 8,
                      color: AppColors.alerta.withValues(alpha: 0.35),
                    ),
                    const SizedBox(height: 4),
                    stats,
                  ],
                ],
              );
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: compact ? 100 : 180,
                        // Foto mais baixa para aproximar o divisor do conteúdo.
                        height: compact ? 120 : 170,
                        child: portrait,
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: details),
                    ],
                  ),
                  if (compact) ...[
                    // Reduz o espaço entre foto/XP, divisor e atributos.
                    const SizedBox(height: 4),
                    Divider(
                      height: 8,
                      color: AppColors.alerta.withValues(alpha: 0.35),
                    ),
                    const SizedBox(height: 4),
                    stats,
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

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
