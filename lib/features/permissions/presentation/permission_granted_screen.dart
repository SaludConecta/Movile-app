import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';
import '../../../core/widgets/app_ui.dart';
import '../../shell/presentation/main_shell.dart';

class PermissionGrantedScreen extends StatelessWidget {
  const PermissionGrantedScreen({super.key});

  void _goTo(BuildContext context, int index) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => MainShell(initialIndex: index)),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenPadding(
        child: ListView(
          children: [
            const SizedBox(height: 16),
            Row(
              children: const [
                Icon(Icons.lock_outline, size: 15),
                SizedBox(width: 6),
                Text(
                  'MINSA · SaludConecta',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                ),
                Spacer(),
                StatusPill('PANTALLA M06'),
              ],
            ),
            const SizedBox(height: 24),
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 64,
                color: AppPalette.ink,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Permiso otorgado',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            const Text(
              'El Dr. Luis Mendoza podrá ver la información autorizada hasta el 08/11/2026. Cada consulta quedará registrada en Accesos.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 17),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  StatusPill('FICHA DE CONFIRMACIÓN'),
                  SizedBox(height: 13),
                  _ConfirmationRow(
                    icon: Icons.person_outline,
                    label: 'Médico autorizado',
                    value: 'Dr. Luis Mendoza',
                  ),
                  _ConfirmationRow(
                    icon: Icons.local_hospital_outlined,
                    label: 'Establecimiento',
                    value: 'Hospital Regional Norte',
                  ),
                  _ConfirmationRow(
                    icon: Icons.calendar_month_outlined,
                    label: 'Vigencia del acceso',
                    value: 'Hasta el 08/11/2026 (30 días)',
                  ),
                  _ConfirmationRow(
                    icon: Icons.fact_check_outlined,
                    label: 'Estado en el sistema',
                    value: 'Notificación enviada a la Red MINSA',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            AppCard(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'ⓘ  Usted puede revisar o revocar este consentimiento cuando lo desee desde la sección principal de Permisos.',
                style: TextStyle(fontSize: 11),
              ),
            ),
            const SizedBox(height: 14),
            PrimaryButton(
              label: 'Volver al inicio',
              onPressed: () => _goTo(context, 0),
            ),
            const SizedBox(height: 7),
            SizedBox(
              height: 46,
              width: double.infinity,
              child: TextButton(
                onPressed: () => _goTo(context, 2),
                child: const Text(
                  'Ver mis permisos',
                  style: TextStyle(
                    color: AppPalette.ink,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Center(
              child: Text(
                'SaludConecta · Red Nacional de Interoperabilidad MINSA\nMinisterio de Salud del Perú · Trámite oficial',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 9, color: AppPalette.muted),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConfirmationRow extends StatelessWidget {
  const _ConfirmationRow({
    required this.icon,
    required this.label,
    required this.value,
  });
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Row(
      children: [
        Icon(icon, size: 18, color: AppPalette.muted),
        const SizedBox(width: 9),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 9, color: AppPalette.muted),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
