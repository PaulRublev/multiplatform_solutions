import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'page_content.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _textFieldValue = '';
  final String _flutterDev = 'https://flutter.dev/';
  late TextEditingController _editingController;

  @override
  void initState() {
    _editingController = TextEditingController(text: _flutterDev);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _makePageView(),
          _makeBottomBar(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Text(
                'APPLICATION RUNNING ON ${kIsWeb ? 'WEB' : Platform.operatingSystem.toUpperCase()}'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  Future<String> _loadingPage(String? name) async {
    name = name ?? '';
    if (name == '') return '';
    Uri uriName = Uri.parse(name);
    try {
      final result = await http.get(uriName);
      return result.body;
    } catch (e) {
      return '';
    }
  }

  Widget _makePageView() {
    return Expanded(
      child: SingleChildScrollView(
        child: _textFieldValue == ''
            ? Container()
            : FutureBuilder<String>(
                future: _loadingPage(_textFieldValue),
                builder: ((context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Container();
                    case ConnectionState.waiting:
                      return const Padding(
                        padding: EdgeInsets.only(
                          top: 48.0,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return PageContent(content: snapshot.data);
                      }
                      return Container();
                    default:
                      return Container();
                  }
                }),
              ),
      ),
    );
  }

  Widget _makeBottomBar() {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 200,
            child: TextField(
              controller: _editingController,
              style: const TextStyle(fontWeight: FontWeight.w800),
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: (() {
                _textFieldValue = _editingController.value.text;
                setState(() {});
              }),
              child: const Text(
                'LOAD',
                textScaleFactor: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
