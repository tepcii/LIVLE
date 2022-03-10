// import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:url_launcher/url_launcher.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Comming soon...'),
      ),
    );
  }
}

// class CommunityPage extends StatefulWidget {
//   @override
//   _CommunityPageState createState() => _CommunityPageState();
// }

// class _CommunityPageState extends State<CommunityPage> {
//   final GlobalKey webViewKey = GlobalKey();

//   InAppWebViewController webViewController;
//   InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
//       crossPlatform: InAppWebViewOptions(
//         useShouldOverrideUrlLoading: true,
//         mediaPlaybackRequiresUserGesture: false,
//       ),
//       android: AndroidInAppWebViewOptions(
//         useHybridComposition: true,
//       ),
//       ios: IOSInAppWebViewOptions(
//         allowsInlineMediaPlayback: true,
//       ));

//   PullToRefreshController pullToRefreshController;
//   String url = '';
//   double progress = 0;
//   final TextEditingController urlController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     pullToRefreshController = PullToRefreshController(
//       options: PullToRefreshOptions(
//         color: Colors.blue,
//       ),
//       onRefresh: () async {
//         if (Platform.isAndroid) {
//           webViewController?.reload();
//         } else if (Platform.isIOS) {
//           webViewController?.loadUrl(urlRequest: URLRequest(url: await webViewController?.getUrl()));
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(title: const Text('Official InAppWebView website')),
//           body: SafeArea(
//               child: Column(children: <Widget>[
//             TextField(
//               decoration: const InputDecoration(prefixIcon: Icon(Icons.search)),
//               controller: urlController,
//               keyboardType: TextInputType.url,
//               onSubmitted: (String value) {
//                 Uri url = Uri.parse(value);
//                 if (url.scheme.isEmpty) {
//                   url = Uri.parse('https://www.google.com/search?q=' + value);
//                 }
//                 webViewController?.loadUrl(urlRequest: URLRequest(url: url));
//               },
//             ),
//             Expanded(
//               child: Stack(
//                 children: <Widget>[
//                   InAppWebView(
//                     key: webViewKey,
//                     initialUrlRequest: URLRequest(url: Uri.parse('https://inappwebview.dev/')),
//                     initialOptions: options,
//                     pullToRefreshController: pullToRefreshController,
//                     onWebViewCreated: (InAppWebViewController controller) {
//                       webViewController = controller;
//                     },
//                     onLoadStart: (InAppWebViewController controller, Uri url) {
//                       setState(() {
//                         this.url = url.toString();
//                         urlController.text = this.url;
//                       });
//                     },
//                     androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
//                       return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
//                     },
//                     shouldOverrideUrlLoading: (InAppWebViewController controller, NavigationAction navigationAction) async {
//                       final Uri uri = navigationAction.request.url;

//                       if (!<String>['http', 'https', 'file', 'chrome', 'data', 'javascript', 'about'].contains(uri.scheme)) {
//                         if (await canLaunch(url)) {
//                           // Launch the App
//                           await launch(
//                             url,
//                           );
//                           // and cancel the request
//                           return NavigationActionPolicy.CANCEL;
//                         }
//                       }

//                       return NavigationActionPolicy.ALLOW;
//                     },
//                     onLoadStop: (InAppWebViewController controller, Uri url) async {
//                       pullToRefreshController.endRefreshing();
//                       setState(() {
//                         this.url = url.toString();
//                         urlController.text = this.url;
//                       });
//                     },
//                     onLoadError: (InAppWebViewController controller, Uri url, int code, String message) {
//                       pullToRefreshController.endRefreshing();
//                     },
//                     onProgressChanged: (InAppWebViewController controller, int progress) {
//                       if (progress == 100) {
//                         pullToRefreshController.endRefreshing();
//                       }
//                       setState(() {
//                         this.progress = progress / 100;
//                         urlController.text = url;
//                       });
//                     },
//                     onUpdateVisitedHistory: (InAppWebViewController controller, Uri url, bool androidIsReload) {
//                       setState(() {
//                         this.url = url.toString();
//                         urlController.text = this.url;
//                       });
//                     },
//                     onConsoleMessage: (InAppWebViewController controller, ConsoleMessage consoleMessage) {
//                       print(consoleMessage);
//                     },
//                   ),
//                   if (progress < 1.0) LinearProgressIndicator(value: progress) else Container(),
//                 ],
//               ),
//             ),
//             ButtonBar(
//               alignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ElevatedButton(
//                   child: const Icon(Icons.arrow_back),
//                   onPressed: () {
//                     webViewController?.goBack();
//                   },
//                 ),
//                 ElevatedButton(
//                   child: const Icon(Icons.arrow_forward),
//                   onPressed: () {
//                     webViewController?.goForward();
//                   },
//                 ),
//                 ElevatedButton(
//                   child: const Icon(Icons.refresh),
//                   onPressed: () {
//                     webViewController?.reload();
//                   },
//                 ),
//               ],
//             ),
//           ]))),
//     );
//   }
// }
