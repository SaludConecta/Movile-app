import 'package:flutter/material.dart';

class HistoryRecord {
  const HistoryRecord({
    required this.title,
    required this.category,
    required this.location,
    required this.date,
    required this.icon,
  });

  final String title;
  final String category;
  final String location;
  final String date;
  final IconData icon;
}
