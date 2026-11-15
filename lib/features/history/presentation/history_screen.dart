import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';
import '../../../core/widgets/app_ui.dart';
import '../data/history_record.dart';
import '../data/mock_history.dart';
import 'result_detail_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String filter = 'Todo';
  String period = 'Este año';
  static const filters = ['Todo', 'Atenciones', 'Resultados', 'Vacunas'];

  List<HistoryRecord> get visibleRecords {
    if (filter == 'Atenciones') {
      return MockHistory.records
          .where((item) => item.category == 'Atención')
          .toList();
    }
    if (filter == 'Resultados') {
      return MockHistory.records
          .where((item) => item.category == 'Resultado')
          .toList();
    }
    if (filter == 'Vacunas') {
      return MockHistory.records
          .where((item) => item.category == 'Vacuna')
          .toList();
    }
    return MockHistory.records;
  }

  @override
  Widget build(BuildContext context) {
    final records = visibleRecords;
    return ScreenPadding(
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Mi historial clínico',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              IconButton(
                onPressed: () =>
                    showMockMessage(context, 'Búsqueda de demostración.'),
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          const Text(
            'Consulte y revise sus atenciones médicas, exámenes de laboratorio y referencias vigentes.',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.folder_open_outlined, size: 16),
              const SizedBox(width: 6),
              Text(
                '${records.length} registros',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 11),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final item in filters)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      label: Text(item, style: const TextStyle(fontSize: 11)),
                      selected: item == filter,
                      onSelected: (_) => setState(() => filter = item),
                      selectedColor: AppPalette.ink,
                      labelStyle: TextStyle(
                        color: item == filter ? Colors.white : AppPalette.ink,
                      ),
                      showCheckmark: false,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                'Periodo: ',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              DropdownButton<String>(
                value: period,
                underline: const SizedBox.shrink(),
                items: const [
                  DropdownMenuItem(value: 'Este año', child: Text('Este año')),
                  DropdownMenuItem(value: 'Todo', child: Text('Todo')),
                ],
                onChanged: (value) =>
                    setState(() => period = value ?? 'Este año'),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () =>
                    showMockMessage(context, 'Filtros de demostración.'),
                icon: const Icon(Icons.tune, size: 16),
                label: const Text('Filtrar'),
              ),
            ],
          ),
          const SizedBox(height: 7),
          if (records.isEmpty)
            const AppCard(
              child: Text(
                'No hay registros para este filtro.',
                style: TextStyle(fontSize: 12),
              ),
            )
          else if (filter == 'Todo') ...[
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'OCTUBRE 2026',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: AppPalette.muted,
                    ),
                  ),
                ),
                Text(
                  '3 registros',
                  style: TextStyle(fontSize: 10, color: AppPalette.muted),
                ),
              ],
            ),
            const SizedBox(height: 7),
            for (final record in records.take(3))
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _HistoryTile(record: record),
              ),
            const SizedBox(height: 6),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'SEPTIEMBRE 2026',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: AppPalette.muted,
                    ),
                  ),
                ),
                Text(
                  '2 registros',
                  style: TextStyle(fontSize: 10, color: AppPalette.muted),
                ),
              ],
            ),
            const SizedBox(height: 7),
            for (final record in records.skip(3))
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _HistoryTile(record: record),
              ),
          ] else ...[
            for (final record in records)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _HistoryTile(record: record),
              ),
          ],
          const SizedBox(height: 10),
          AppCard(
            padding: const EdgeInsets.all(11),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, size: 17, color: AppPalette.muted),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Usted está visualizando únicamente los registros sincronizados con el Sistema Nacional Integrado. Para consultas históricas previas a 2024, acérquese a Admisión de su establecimiento.',
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
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({required this.record});
  final HistoryRecord record;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ResultDetailScreen(record: record)),
      ),
      borderRadius: BorderRadius.circular(12),
      child: AppCard(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            IconTile(record.icon, size: 34),
            const SizedBox(width: 9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    record.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${record.category} · ${record.location} · ${record.date}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 9,
                      color: AppPalette.muted,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 18),
          ],
        ),
      ),
    );
  }
}
