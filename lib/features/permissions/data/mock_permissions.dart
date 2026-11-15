import 'package:flutter/material.dart';

import 'permission_entry.dart';

abstract final class MockPermissions {
  static const entries = [
    PermissionEntry(
      doctor: 'Dr. Luis Mendoza',
      facility: 'Hospital Regional Norte',
      purpose: 'Atención por referencia',
      data: 'Alergias, diagnósticos, medicamentos y resultados',
      expires: 'Hasta: 08/11/2026 (vigente por 30 días)',
      status: 'VIGENTE',
      icon: Icons.medical_services_outlined,
    ),
    PermissionEntry(
      doctor: 'Dra. Carmen Salazar',
      facility: 'C.S. Santa Rosa · Medicina General',
      purpose: 'Control médico',
      data: 'Diagnósticos y medicamentos recientes',
      expires: 'Hasta: 12/10/2026 (vence en 3 días)',
      status: 'POR VENCER',
      icon: Icons.local_hospital_outlined,
    ),
    PermissionEntry(
      doctor: 'Dr. Jorge Paredes',
      facility: 'Instituto Nacional de Salud',
      purpose: 'Laboratorio',
      data: 'Exámenes de laboratorio y pruebas complementarias',
      expires: 'Hasta: 24/11/2026',
      status: 'VIGENTE',
      icon: Icons.science_outlined,
    ),
  ];
}
