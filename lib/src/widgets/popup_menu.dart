import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_context_menu_action.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 20,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CustomContextMenuAction(
            icon: CupertinoIcons.person_alt,
            child: Text(
              'VIEW PROFILE',
              textScaleFactor: 1.4,
            ),
          ),
          makeDivider(),
          const CustomContextMenuAction(
            icon: CupertinoIcons.person_2_alt,
            child: Text(
              'FRIENDS',
              textScaleFactor: 1.4,
            ),
          ),
          makeDivider(),
          const CustomContextMenuAction(
            icon: CupertinoIcons.arrow_down_doc_fill,
            child: Text(
              'REPORT',
              textScaleFactor: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget makeDivider() {
    return const Divider(
      color: Colors.black,
      thickness: 4,
      height: 1,
      indent: 5,
      endIndent: 5,
    );
  }
}
