import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double size = 50;
    final Color borderColor = Colors.grey.withOpacity(0.2);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading:  SizedBox(
        width: size,
        height: size,
        child: CircleAvatar(
          child: Image.asset("assets/images/profile-me.png"),
        ),
      ),
      title: const Text(
        "Gael Vinou",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text("Morning, Gael"),
      trailing: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Stack(
            children: const [
              Icon(Icons.notifications_none_outlined, size: 30),
              Positioned(
                bottom: 3,
                right: 2,
                child: Icon(Icons.circle, size: 14, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
