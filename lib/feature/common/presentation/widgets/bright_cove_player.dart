import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrightcovePlayer extends StatefulWidget {
  const BrightcovePlayer({required this.url, super.key});
  final String url;

  @override
  State<BrightcovePlayer> createState() => _BrightcovePlayerState();
}

class _BrightcovePlayerState extends State<BrightcovePlayer> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(final BuildContext context) => AspectRatio(
      aspectRatio: 16 / 9,
      child: WebViewWidget(controller: _controller),
    );
}
