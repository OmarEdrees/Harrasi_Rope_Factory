import 'package:flutter/material.dart';

class DashBoardItemModel {
  final String title;
  final IconData icon;
  final String ? route;
  DashBoardItemModel({
    required this.title,
    required this.icon,
    this.route,
  });
}