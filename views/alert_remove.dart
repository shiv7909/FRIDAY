import 'package:flutter/material.dart';

class RemoveApiDialog extends StatelessWidget {
   const RemoveApiDialog({super.key});



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirmation !"),
      content: const Text("Are you sure you want to remove the API key?"),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop(false); // Dismiss the dialog with false
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true); // Dismiss the dialog with true
          },
          child: const Text("Remove"),
        ),
      ],
    );
  }
}
