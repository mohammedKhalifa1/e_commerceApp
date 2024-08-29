import 'package:e_commerce/core/class/status_request.dart';
import 'package:flutter/material.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: Text("Loading"),
          )
        : statusRequest == StatusRequest.failure
            ? const Center(
                child: Text("failure"),
              )
            : statusRequest == StatusRequest.serverFailure
                ? const Center(
                    child: Text("serverFailure"),
                  )
                : statusRequest == StatusRequest.notFind
                    ? const Center(
                        child: Text("re email or password"),
                      )
                    : statusRequest == StatusRequest.success
                        ? widget
                        : const Center(
                            child: Text("restart"),
                          );
  }
}
