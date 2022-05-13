import 'dart:io';

import 'package:flutter_stetho/src/http_client.dart';

class StethoHttpOverrides extends HttpOverrides {
  final String Function(
    Uri url,
    Map<String, String>? environment,
  )? findProxyFromEnvironmentFn;
  final HttpClient Function(SecurityContext? context)? createHttpClientFn;

  StethoHttpOverrides({
    this.findProxyFromEnvironmentFn,
    this.createHttpClientFn,
  });

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = createHttpClientFn != null
        ? createHttpClientFn!.call(context)
        : super.createHttpClient(context);

    return Platform.isAndroid ? StethoHttpClient(client) : client;
  }

  @override
  String findProxyFromEnvironment(Uri url, Map<String, String>? environment) =>
      findProxyFromEnvironmentFn != null
          ? findProxyFromEnvironmentFn!.call(url, environment)
          : super.findProxyFromEnvironment(url, environment);
}
