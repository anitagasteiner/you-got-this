import 'package:flutter/material.dart';

class ChartCategoriesModel {
  final String key;
  final String label;
  final Color color;
  final double value;

  const ChartCategoriesModel({
    required this.key,
    required this.label,
    required this.color,
    required this.value,
  });
}