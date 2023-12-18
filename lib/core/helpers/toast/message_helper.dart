import 'package:bloc_app/core/helpers/toast/alert_content.dart';
import 'package:bloc_app/core/helpers/toast/alert_content_type.dart';
import 'package:bloc_app/core/models/response_model.dart';
import 'package:flutter/material.dart';

Future<void> show(BuildContext context, ResponseModel message,
    {String? title}) async {
  await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (builder) {
        Future.delayed(const Duration(seconds: 2), Navigator.of(builder).pop);
        return PopScope(
          canPop: false,
          child: Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: AlertContent(
                response: message,
                contentType:
                    AlertContentType(status: message.status!).getContent()),
          ),
        );
      });
}
