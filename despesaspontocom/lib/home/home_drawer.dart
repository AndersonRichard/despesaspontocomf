import 'package:flutter/material.dart';
import 'package:despesaspontocom/common/app_colors.dart';
import 'package:despesaspontocom/components/gradient_background.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GradientBackground(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: AppColors.whiteColor),
              title: const Text(
                'Perfil',
                style: TextStyle(color: AppColors.whiteColor),
              ),
              onTap: () {
                // Navegar para a tela de perfil
                Navigator.pop(context); // Fecha o drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.whiteColor),
              title: const Text(
                'Configurações',
                style: TextStyle(color: AppColors.whiteColor),
              ),
              onTap: () {
                // Navegar para a tela de configurações
                Navigator.pop(context); // Fecha o drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}