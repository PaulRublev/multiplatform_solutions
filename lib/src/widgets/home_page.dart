import 'package:flutter/material.dart';

import '../persons_list.dart';
import 'persons_grid_view.dart';
import 'persons_list_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Person>> persons;

  @override
  void initState() {
    persons = personsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MediaQuery.of(context).size.width >= 720
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _makeMenuBar(true),
                  _makePersonsView(true),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _makeMenuBar(false),
                  _makePersonsView(false),
                ],
              ),
      ),
    );
  }

  Widget _makeMenuBar(bool isLandscape) {
    return Container(
      color: Colors.blue,
      width: isLandscape ? 250 : null,
      height: isLandscape ? null : 100,
      child: Align(
        alignment: isLandscape ? Alignment.topCenter : Alignment.center,
        child: Text(
          widget.title,
          textScaleFactor: isLandscape ? 2 : 3,
        ),
      ),
    );
  }

  Widget _makePersonsView(bool isLandscape) {
    return Expanded(
      child: FutureBuilder(
        future: persons,
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('none');
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              List<Person>? persons = snapshot.data;
              return snapshot.hasError == true
                  ? Text('${snapshot.error}')
                  : isLandscape
                      ? PersonsGridView(
                          persons: persons,
                        )
                      : PersonsListView(
                          persons: persons,
                        );
            default:
              return const Text('default');
          }
        },
      ),
    );
  }
}
