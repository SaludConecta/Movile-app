import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';
import '../../../core/widgets/app_ui.dart';
import '../data/history_record.dart';

class ResultDetailScreen extends StatelessWidget {
  const ResultDetailScreen({super.key, required this.record});

  final HistoryRecord record;

  @override
  Widget build(BuildContext context) {
    final isResult = record.category == 'Resultado';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isResult ? 'Detalle de resultado' : 'Detalle de atención',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 14),
            child: Icon(Icons.account_circle, size: 21),
          ),
        ],
      ),
      body: ScreenPadding(
        child: ListView(
          children: [
            Row(
              children: [
                const Icon(Icons.history, size: 15),
                const SizedBox(width: 6),
                Text(
                  'MI HISTORIAL · ${record.category.toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: AppPalette.muted,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (isResult) ..._resultDetails(context) else _visitDetails(),
          ],
        ),
      ),
    );
  }

  List<Widget> _resultDetails(BuildContext context) => [
    AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  record.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const StatusPill('VALIDADO', color: AppPalette.green),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '7.2%',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: AppPalette.ink,
            ),
          ),
          const Text(
            'Valor de referencia: Menor a 5.7%',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 9),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: AppPalette.softBlue2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'ⓘ  Su resultado actual se ubica por encima del rango referencial. Consulte a su médico tratante.',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(height: 13),
    AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(Icons.show_chart, size: 17),
              SizedBox(width: 6),
              Text(
                'Evolución de HbA1c',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              Spacer(),
              Text(
                'Últimos 10 meses',
                style: TextStyle(fontSize: 9, color: AppPalette.muted),
              ),
            ],
          ),
          SizedBox(height: 15),
          SizedBox(height: 126, child: _TrendChart()),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.circle, size: 7),
              SizedBox(width: 5),
              Text('Valor medido', style: TextStyle(fontSize: 9)),
              SizedBox(width: 16),
              Icon(Icons.remove, size: 12, color: AppPalette.muted),
              SizedBox(width: 4),
              Text('Límite normal (5.7%)', style: TextStyle(fontSize: 9)),
            ],
          ),
        ],
      ),
    ),
    const SizedBox(height: 13),
    AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(Icons.local_hospital_outlined, size: 16),
              SizedBox(width: 6),
              Text(
                'Procedencia clínica',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          SizedBox(height: 10),
          _InfoLine(label: 'Establecimiento', value: 'C.S. Santa Rosa'),
          _InfoLine(label: 'Fecha de toma', value: '02/10/2026'),
          _InfoLine(label: 'Registrado por', value: 'Lic. Ana Torres'),
          _InfoLine(label: 'Estado del informe', value: 'VALIDADO'),
        ],
      ),
    ),
    const SizedBox(height: 12),
    PrimaryButton(
      label: 'Preguntar al asistente sobre este resultado',
      icon: Icons.smart_toy_outlined,
      dark: false,
      onPressed: () => showMockMessage(context, 'Asistente de demostración.'),
    ),
    const SizedBox(height: 14),
    const Center(
      child: Text(
        'DOCUMENTO INTEROPERABLE\nRegistro clínico interoperable oficial del Ministerio de Salud (MINSA).',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 9, color: AppPalette.muted),
      ),
    ),
  ];

  Widget _visitDetails() => AppCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconTile(record.icon, size: 42),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                record.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const StatusPill('VALIDADO', color: AppPalette.green),
          ],
        ),
        const SizedBox(height: 14),
        _InfoLine(label: 'Tipo de registro', value: record.category),
        _InfoLine(label: 'Establecimiento', value: record.location),
        _InfoLine(label: 'Fecha', value: record.date),
        const SizedBox(height: 10),
        const Text(
          'Este registro forma parte de su historia clínica interoperable.',
          style: TextStyle(fontSize: 11, color: AppPalette.muted),
        ),
      ],
    ),
  );
}

class _InfoLine extends StatelessWidget {
  const _InfoLine({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 10, color: AppPalette.muted),
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}

class _TrendChart extends StatelessWidget {
  const _TrendChart();

  @override
  Widget build(BuildContext context) =>
      CustomPaint(painter: _TrendPainter(), child: const SizedBox.expand());
}

class _TrendPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()
      ..color = AppPalette.line
      ..strokeWidth = 1;
    for (var i = 0; i < 4; i++) {
      final y = 14 + i * (size.height - 34) / 3;
      canvas.drawLine(Offset(28, y), Offset(size.width - 4, y), grid);
    }
    final points = [
      Offset(34, size.height * .65),
      Offset(size.width * .32, size.height * .56),
      Offset(size.width * .54, size.height * .44),
      Offset(size.width * .77, size.height * .51),
      Offset(size.width - 13, size.height * .37),
    ];
    final line = Paint()
      ..color = AppPalette.ink
      ..strokeWidth = 2.2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (final point in points.skip(1)) {
      path.lineTo(point.dx, point.dy);
    }
    canvas.drawPath(path, line);
    final dot = Paint()..color = AppPalette.ink;
    for (final point in points) {
      canvas.drawCircle(point, 3, dot);
    }
    final normal = Paint()
      ..color = AppPalette.muted
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    for (var x = 28.0; x < size.width; x += 7) {
      canvas.drawLine(
        Offset(x, size.height * .76),
        Offset(x + 3, size.height * .76),
        normal,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
