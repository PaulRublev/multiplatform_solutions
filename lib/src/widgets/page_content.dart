import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class PageContent extends StatelessWidget {
  const PageContent({super.key, required this.content});

  final String? content;
  final String _corsHeader = 'CORS Header:';
  final String _corsValue = 'None';

  String _parseTitle(String html) {
    var htmlDocument = parse(html);
    try {
      return htmlDocument.getElementsByTagName('title').first.text;
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    String data = _parseTitle(content ?? '');
    data = data.replaceAll(RegExp('\n'), ' ').trim();

    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        top: 55,
        right: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data,
            textScaleFactor: 2,
          ),
          const SizedBox(height: 5),
          content == ''
              ? Container()
              : Text(
                  '$_corsHeader $_corsValue',
                  textScaleFactor: 1.5,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
          Text('$content'),
        ],
      ),
    );
  }
}
