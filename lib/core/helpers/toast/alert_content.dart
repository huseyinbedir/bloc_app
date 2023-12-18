// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_app/core/helpers/toast/alert_content_type.dart';
import 'package:bloc_app/core/models/response_model.dart';
import 'package:flutter/material.dart';

class AlertContent extends StatelessWidget {
  final ResponseModel response;
  final AlertContentType contentType;

  const AlertContent(
      {Key? key, required this.response, required this.contentType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: contentType.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 50,
            decoration: BoxDecoration(
              color: contentType.backgroundColor!.withAlpha(5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              contentType.icons,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Durum",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    response.description!,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
