import 'package:get/get.dart';

import 'app_exception.dart';
import 'no_result_screen.dart';


class FetchDataException extends AppException {
  String message;

  FetchDataException(this.message)
      : super(message, "Error During Communication: ") {
    Get.to(() => NoResultScreen(message: message.toString()));
  }
}
