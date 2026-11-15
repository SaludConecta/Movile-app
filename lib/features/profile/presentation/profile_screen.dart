import 'package:flutter/material.dart';

import '../../../core/widgets/app_ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: ListView(
        children: [
          const Text(
            'Mi perfil',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          const AppCard(
            child: Row(
              children: [
                IconTile(Icons.person_outline, size: 48),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rosa Huamán Quispe',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Text('DNI · 45120988', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          for (final item in const [
            (Icons.badge_outlined, 'Datos personales'),
            (Icons.security_outlined, 'Seguridad y contraseña'),
            (Icons.notifications_outlined, 'Notificaciones'),
            (Icons.help_outline, 'Ayuda y soporte'),
          ])
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AppCard(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 13,
                ),
                child: Row(
                  children: [
                    Icon(item.$1, size: 19),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item.$2,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Icon(Icons.chevron_right, size: 18),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 8),
          PrimaryButton(
            label: 'Cerrar sesión',
            onPressed: () =>
                showMockMessage(context, 'Cierre de sesión de demostración.'),
            dark: false,
          ),
        ],
      ),
    );
  }
}
