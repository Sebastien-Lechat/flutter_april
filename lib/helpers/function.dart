import 'package:flutter/material.dart';

class ShowConfirmAlertDialog extends AlertDialog {
  const ShowConfirmAlertDialog({Key? key}) : super(key: key);

  Future<void> show(
    BuildContext context,
    String title,
    Widget widget,
    String textOk,
    textCancel,
    Function functionOk,
    Function functionCancel,
  ) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text(title),
            content: widget,
            actions: <Widget>[
              TextButton(
                child: Text(textCancel),
                onPressed: () {
                  functionCancel();
                },
              ),
              TextButton(
                child: Text(textOk),
                onPressed: () {
                  functionOk();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
