import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/src/app_platform.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget webView(String url) =>
    AppPlatform.isMobile ? WebView(initialUrl: url) : HyperLink(url: url);

class HyperLink extends StatelessWidget {
  final String url;

  const HyperLink({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrlString(url),
      child: Center(
        child: Text(url),
      ),
    );
  }
}
