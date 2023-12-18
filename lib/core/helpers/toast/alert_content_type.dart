import 'package:bloc_app/core/helpers/toast/alert_color.dart';
import 'package:flutter/material.dart';

class AlertContentType {
  final String status;
  final Color? backgroundColor;
  final IconData? icons;

  AlertContentType({required this.status, this.backgroundColor, this.icons});
  static AlertContentType success = AlertContentType(
      status: "success",
      backgroundColor: AlertColor.successColor,
      icons: Icons.check);
  static AlertContentType danger = AlertContentType(
      status: "danger",
      backgroundColor: AlertColor.dangerColor,
      icons: Icons.dangerous);
  static AlertContentType warning = AlertContentType(
      status: "warning",
      backgroundColor: AlertColor.warningColor,
      icons: Icons.announcement);
  static AlertContentType info = AlertContentType(
      status: "info", backgroundColor: AlertColor.infoColor, icons: Icons.info);

  AlertContentType getContent() {
    switch (status) {
      case "success":
        return success;
      case "danger":
        return danger;
      case "info":
        return info;
      case "warning":
        return warning;
      case "dangerius":
        return danger;
      default:
        return success;
    }
  }
}
