import 'package:flutter/cupertino.dart';

class CustomContextMenuAction extends StatelessWidget {
  const CustomContextMenuAction({super.key, required this.child, this.icon});

  final Widget child;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenuAction(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 45,
          ),
          const SizedBox(
            width: 10,
          ),
          child,
        ],
      ),
    );
  }
}
