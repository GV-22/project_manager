import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/material.dart';

class StackedMemberAvatars extends StatelessWidget {
  final int maxToSHow;

  const StackedMemberAvatars({
    required this.maxToSHow,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AvatarStack(
      // width: 100,
      height: 40,
      // infoWidgetBuilder: (left) => Text("$leftAvatars"),
      borderWidth: 0,
      borderColor: Colors.transparent,
      avatars: [
        for (var n = 0; n < maxToSHow; n++)
          NetworkImage('https://i.pravatar.cc/150?img=$n')
      ],
    );
  }
}
