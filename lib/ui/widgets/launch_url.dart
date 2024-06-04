import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LaunchUrl extends StatelessWidget {
  const LaunchUrl(this.urlString, {super.key, this.child});

  final String urlString;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final canLaunch = await canLaunchUrlString(urlString);
        if (canLaunch) await launchUrlString(urlString);
      },
      child: child,
    );
  }
}