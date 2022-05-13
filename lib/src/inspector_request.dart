class FlutterStethoInspectorRequest {
  final int? friendlyNameExtra;
  final String url;
  final String method;
  final List<int> body;
  final String id;
  final String friendlyName;
  final Map<String, String> headers;

  FlutterStethoInspectorRequest({
    required this.url,
    required this.method,
    required this.id,
    required this.headers,
    required this.body,
    this.friendlyName = 'Flutter Stetho',
    this.friendlyNameExtra,
  });

  Map<String, dynamic> toMap() => {
        'friendlyNameExtra': friendlyNameExtra,
        'url': url,
        'method': method,
        'body': body,
        'id': id,
        'friendlyName': friendlyName,
        'headers': headers,
      };
}
