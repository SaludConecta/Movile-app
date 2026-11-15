import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';
import '../../../core/widgets/app_ui.dart';
import '../../history/data/mock_history.dart';
import '../../history/presentation/result_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.onHistory,
    required this.onReviewAccess,
  });

  final VoidCallback onHistory;
  final VoidCallback onReviewAccess;

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: ListView(
        children: [
          Row(
            children: [
              const BrandMark(compact: true),
              const SizedBox(width: 9),
              const Expanded(
                child: Text(
                  'MINSA PERÚ · RED INTEROPERABLE',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: AppPalette.muted,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => showMockMessage(
                  context,
                  'No tienes notificaciones nuevas.',
                ),
                icon: const Icon(Icons.notifications_none),
              ),
              const Icon(Icons.account_circle, size: 22),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Hola, Rosa',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const StatusPill('En línea', color: AppPalette.green),
            ],
          ),
          const SizedBox(height: 3),
          const Text(
            '◷  Última actualización: 09/10/2026 08:15',
            style: TextStyle(fontSize: 11),
          ),
          const SizedBox(height: 18),
          AppCard(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.notifications_active_outlined, size: 16),
                    SizedBox(width: 7),
                    Expanded(
                      child: Text(
                        'SOLICITUD DE ACCESO PENDIENTE',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    StatusPill('1 NUEVA'),
                  ],
                ),
                const SizedBox(height: 11),
                const Text(
                  'Dr. Luis Mendoza · Hospital Regional Norte · Para: atención por referencia',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                ),
                const SizedBox(height: 7),
                const Text(
                  '◉  Establecimiento: Hospital Regional Norte\n▣  Fecha: 09/10/2026 · Solicitud: pendiente de validación',
                  style: TextStyle(fontSize: 10, height: 1.5),
                ),
                const SizedBox(height: 10),
                PrimaryButton(
                  label: 'Revisar solicitud',
                  icon: Icons.arrow_forward,
                  onPressed: onReviewAccess,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionHeading('Su próxima referencia', action: 'Programada'),
          AppCard(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hospital Regional Norte · Endocrinología',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 5),
                const Text(
                  '▣  Fecha asignada: 15/10/2026',
                  style: TextStyle(fontSize: 10),
                ),
                const SizedBox(height: 9),
                SizedBox(
                  width: double.infinity,
                  height: 34,
                  child: OutlinedButton(
                    onPressed: () => showMockMessage(
                      context,
                      'Detalle de cita de demostración.',
                    ),
                    child: const Text(
                      'Ver detalle de la cita',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SectionHeading(
            'Últimos resultados',
            action: 'Laboratorio Central',
            onAction: onHistory,
          ),
          const _HomeResult(),
          const SizedBox(height: 14),
          AppCard(
            padding: const EdgeInsets.all(11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    IconTile(Icons.support_agent_outlined, size: 30),
                    SizedBox(width: 9),
                    Expanded(
                      child: Text(
                        '¿Tiene dudas sobre su información?',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 39, top: 5),
                  child: Text(
                    'Puede consultar en cualquier momento términos clínicos, el estado de sus trámites o cómo gestionar sus accesos.',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 34,
                  child: ElevatedButton.icon(
                    onPressed: () =>
                        showMockMessage(context, 'Asistente de demostración.'),
                    icon: const Icon(Icons.smart_toy_outlined, size: 15),
                    label: const Text(
                      'Preguntar al asistente',
                      style: TextStyle(fontSize: 11),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppPalette.softBlue,
                      foregroundColor: AppPalette.ink,
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeResult extends StatelessWidget {
  const _HomeResult();

  @override
  Widget build(BuildContext context) {
    final record = MockHistory.records[1];
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ResultDetailScreen(record: record)),
      ),
      borderRadius: BorderRadius.circular(13),
      child: AppCard(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const IconTile(Icons.science_outlined, size: 36),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    record.title,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${record.location} · ${record.date}',
                    style: const TextStyle(fontSize: 9),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  '7.2%',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
                Text('02/10/2026', style: TextStyle(fontSize: 8)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
