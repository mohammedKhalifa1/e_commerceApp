import 'package:e_commerce/core/class/status_request.dart';

handlingData(dynamic statusRequest) {
  if (statusRequest != StatusRequest.success) {
    return statusRequest;
  }
}
