import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common_scaffold.dart';

class NoResultScreen extends StatelessWidget {
  const NoResultScreen(
      {Key key, this.message, this.button = false, this.goBack = true})
      : super(key: key);

  final String message;

  final bool button, goBack;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => goBack,
      child: CommonScaffold(
        backgroundColor:
            Colors.black,
        child: Stack(
          children: [

            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(message ?? "No Result found",),
                    SizedBox(
                      height: 55,
                      width: Get.width / 1.3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          primary: Colors.red,
                        ),
                        onPressed: () {
                              Get.back();
                                },
                        child: Text("GO home"),
                      ),
                    ),

               ]
              )
            ),
          ],
        ),
      ),
    );
  }
}
