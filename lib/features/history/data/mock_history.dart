import 'package:flutter/material.dart';

import 'history_record.dart';

abstract final class MockHistory {
  static const records = [
    HistoryRecord(
      title: 'Consulta de control · Medicina general',
      category: 'Atención',
      location: 'C.S. Santa Rosa',
      date: '02/10/2026',
      icon: Icons.medical_services_outlined,
    ),
    HistoryRecord(
      title: 'Hemoglobina glicada (HbA1c)',
      category: 'Resultado',
      location: 'C.S. Santa Rosa',
      date: '02/10/2026',
      icon: Icons.science_outlined,
    ),
    HistoryRecord(
      title: 'Referencia a Hospital Regional Norte',
      category: 'Referencia',
      location: 'C.S. Santa Rosa',
      date: '01/10/2026',
      icon: Icons.directions_walk_outlined,
    ),
    HistoryRecord(
      title: 'Control de hipertensión y glucosa',
      category: 'Atención',
      location: 'C.S. Santa Rosa',
      date: '15/09/2026',
      icon: Icons.monitor_heart_outlined,
    ),
    HistoryRecord(
      title: 'Perfil lipídico completo',
      category: 'Resultado',
      location: 'Lab. Central',
      date: '10/09/2026',
      icon: Icons.biotech_outlined,
    ),
  ];
}
