import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';
import '../../../core/widgets/app_ui.dart';
import '../data/mock_permissions.dart';
import '../data/permission_entry.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({super.key});

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  String selected = 'Vigentes (3)';
  static const tabs = [
    'Pendientes (1)',
    'Vigentes (3)',
    'Vencidos',
    'Revocados',
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Mis permisos',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              IconButton(
                onPressed: () => showMockMessage(
                  context,
                  'No tienes notificaciones nuevas.',
                ),
                icon: const Icon(Icons.notifications_none),
              ),
              const Icon(Icons.account_circle, size: 21),
            ],
          ),
          const Text(
            'Supervise y gestione las autorizaciones de acceso a su historia clínica unificada.',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final tab in tabs)
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: ChoiceChip(
                      label: Text(tab, style: const TextStyle(fontSize: 10)),
                      selected: selected == tab,
                      onSelected: (_) => setState(() => selected = tab),
                      selectedColor: AppPalette.ink,
                      labelStyle: TextStyle(
                        color: selected == tab ? Colors.white : AppPalette.ink,
                      ),
                      showCheckmark: false,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          if (selected == 'Pendientes (1)') _pending(context),
          if (selected == 'Vigentes (3)')
            ...MockPermissions.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _PermissionCard(entry: entry),
              ),
            ),
          if (selected == 'Vencidos' || selected == 'Revocados')
            AppCard(
              child: Text(
                'No hay permisos ${selected.toLowerCase()} en este momento.',
                style: const TextStyle(fontSize: 12),
              ),
            ),
          const SizedBox(height: 8),
          AppCard(
            padding: const EdgeInsets.all(11),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.lock_outline, size: 17, color: AppPalette.muted),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Usted tiene control total sobre su privacidad: puede revocar cualquiera de estos permisos en cualquier momento y el efecto es inmediato.\nLey N° 29733 de Protección de Datos Personales',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pending(BuildContext context) => AppCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dr. Luis Mendoza',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 4),
        const Text(
          'Hospital Regional Norte · Atención por referencia',
          style: TextStyle(fontSize: 11),
        ),
        const SizedBox(height: 10),
        PrimaryButton(
          label: 'Revisar solicitud',
          icon: Icons.arrow_forward,
          onPressed: () => showMockMessage(
            context,
            'Abra la pestaña Accesos para revisar la solicitud.',
          ),
        ),
      ],
    ),
  );
}

class _PermissionCard extends StatelessWidget {
  const _PermissionCard({required this.entry});
  final PermissionEntry entry;

  @override
  Widget build(BuildContext context) {
    final statusColor = entry.status == 'POR VENCER'
        ? AppPalette.amber
        : AppPalette.green;
    return AppCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  entry.doctor,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              StatusPill(entry.status, color: statusColor),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right, size: 18),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(entry.icon, size: 14),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  entry.facility,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text('Datos: ${entry.data}', style: const TextStyle(fontSize: 10)),
          const SizedBox(height: 5),
          Text('⌛  ${entry.expires}', style: const TextStyle(fontSize: 10)),
          if (entry.status == 'POR VENCER')
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () =>
                    showMockMessage(context, 'Permiso renovado por 30 días.'),
                child: const Text('Renovar', style: TextStyle(fontSize: 11)),
              ),
            ),
        ],
      ),
    );
  }
}
