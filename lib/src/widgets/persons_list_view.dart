import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../persons_list.dart';
import 'popup_menu.dart';

class PersonsListView extends StatelessWidget {
  const PersonsListView({super.key, this.persons});

  final List<Person>? persons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: persons!.length,
      itemBuilder: ((context, index) => Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
            color: Colors.blue,
            child: ListTile(
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: ((context) {
                    return const PopupMenu();
                  }),
                );
              },
              visualDensity: const VisualDensity(vertical: 1.6),
              isThreeLine: true,
              minLeadingWidth: 80,
              leading: CircleAvatar(
                maxRadius: 30,
                backgroundImage: AssetImage(persons![index].asset),
              ),
              title: Text(
                persons![index].name,
                textScaleFactor: 1.6,
              ),
              subtitle: Text(persons![index].email),
            ),
          )),
    );
  }
}
