import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget webView(String url) => WebPlatformWebView(url: url);

class WebPlatformWebView extends StatelessWidget {
  final String url;

  const WebPlatformWebView({super.key, required this.url});

  Future<void> _launchOnSelf(Uri url) async {
    if (!await launchUrl(
      url,
      webOnlyWindowName: '_self',
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _launchOnSelf(Uri.parse(url)),
        builder: (context, snapshot) => Container());
  }
}
