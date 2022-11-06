import 'package:flutter/material.dart';

class AddCallToAction extends StatelessWidget {
  final String label;
  final Function handler;

  const AddCallToAction({required this.label, required this.handler, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => handler(),
      icon: const Icon(Icons.add, color: Colors.blue),
      label: Text(
        label,
        style: const TextStyle(color: Colors.blue, fontSize: 14),
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.blue.withOpacity(0.2),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 8, horizontal: 15)),
      ),
    );
  }
}
