import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'mock_webview.dart'
    if (dart.library.io) 'non_web_platform_webview.dart'
    if (dart.library.html) 'web_platform_webview.dart';

class PageContent extends StatelessWidget {
  const PageContent({super.key, required this.content, required this.url});

  final String? content;
  final String url;
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
    String title = _parseTitle(content ?? '');
    title = title.replaceAll(RegExp('\n'), ' ').trim();

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
            title,
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
          content == ''
              ? Container()
              : Expanded(
                  child: webView(url),
                ),
        ],
      ),
    );
  }
}
