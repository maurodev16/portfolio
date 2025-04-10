import 'package:flutter/material.dart';

class TipCard {
  final String title;
  final String author;
  final String date;
  final String content;
  final IconData icon;
  final Color iconColor;

  TipCard({
    required this.title,
    required this.author,
    required this.date,
    required this.content,
    required this.icon,
    required this.iconColor,
  });
}
