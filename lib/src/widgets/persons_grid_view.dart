import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import '../persons_list.dart';
import 'popup_menu.dart';

class PersonsGridView extends StatelessWidget {
  const PersonsGridView({super.key, this.persons});

  final List<Person>? persons;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      crossAxisCount: 3,
      children: [
        ...persons!.map(
          (person) => Builder(builder: (context) {
            return GestureDetector(
              onTap: () => showPopover(
                  context: context,
                  bodyBuilder: (context) {
                    return const PopupMenu();
                  },
                  height: 270,
                  width: 260,
                  direction: PopoverDirection.left),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: FittedBox(
                          clipBehavior: Clip.hardEdge,
                          fit: BoxFit.fitWidth,
                          child: CircleAvatar(
                            maxRadius: 1000,
                            backgroundImage: AssetImage(person.asset),
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          person.name,
                          textScaleFactor: 1.2,
                          maxLines: 1,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          person.email,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
