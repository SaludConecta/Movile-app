import 'package:flutter/material.dart';

class PermissionEntry {
  const PermissionEntry({
    required this.doctor,
    required this.facility,
    required this.purpose,
    required this.data,
    required this.expires,
    required this.status,
    required this.icon,
  });

  final String doctor;
  final String facility;
  final String purpose;
  final String data;
  final String expires;
  final String status;
  final IconData icon;
}
