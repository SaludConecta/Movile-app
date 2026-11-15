import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';
import '../../../core/widgets/app_ui.dart';
import 'permission_granted_screen.dart';

class AccessRequestScreen extends StatelessWidget {
  const AccessRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: ListView(
        children: [
          Row(
            children: [
              const Icon(Icons.arrow_back, size: 19),
              const SizedBox(width: 8),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SALUDCONECTA',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        color: AppPalette.muted,
                      ),
                    ),
                    Text(
                      'Solicitud de acceso',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.account_circle, size: 22),
            ],
          ),
          const SizedBox(height: 18),
          const Row(
            children: [
              Icon(Icons.assignment_ind_outlined, size: 18),
              SizedBox(width: 7),
              Text(
                'Revise la solicitud',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'Un profesional de la salud solicita autorización temporal para consultar sus antecedentes clínicos.',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 13),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    StatusPill('EXPEDIENTE CLÍNICO DIGITAL'),
                    SizedBox(width: 6),
                    StatusPill('ESTADO: PENDIENTE', color: AppPalette.amber),
                  ],
                ),
                const SizedBox(height: 13),
                const _RequestInfo(
                  label: 'Quién solicita:',
                  value: 'Dr. Luis Mendoza, Médico general',
                  icon: Icons.person_outline,
                ),
                const _RequestInfo(
                  label: 'Establecimiento:',
                  value: 'Hospital Regional Norte',
                  icon: Icons.local_hospital_outlined,
                ),
                const _RequestInfo(
                  label: 'Para qué:',
                  value: 'Atención por referencia desde C.S. Santa Rosa',
                  icon: Icons.info_outline,
                ),
                const _RequestInfo(
                  label: 'Qué información:',
                  value: 'Alergias, diagnósticos, medicamentos y resultados',
                  icon: Icons.folder_open_outlined,
                ),
                const _RequestInfo(
                  label: 'Por cuánto tiempo:',
                  value: '30 días (hasta el 08/11/2026)',
                  icon: Icons.calendar_month_outlined,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          AppCard(
            padding: const EdgeInsets.all(12),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.lock_outline, size: 21),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Puede revocar este permiso en cualquier momento desde Permisos.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Cada consulta que realice el médico quedará registrada en su historial de accesos.',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          PrimaryButton(
            label: 'Autorizar acceso',
            icon: Icons.check_circle_outline,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const PermissionGrantedScreen(),
              ),
            ),
          ),
          const SizedBox(height: 8),
          PrimaryButton(
            label: 'Denegar',
            icon: Icons.cancel_outlined,
            dark: false,
            onPressed: () => showMockMessage(context, 'Solicitud denegada.'),
          ),
        ],
      ),
    );
  }
}

class _RequestInfo extends StatelessWidget {
  const _RequestInfo({
    required this.label,
    required this.value,
    required this.icon,
  });
  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 7),
    padding: const EdgeInsets.all(9),
    decoration: BoxDecoration(
      color: AppPalette.softBlue2,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: AppPalette.muted),
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Icon(icon, size: 14),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
