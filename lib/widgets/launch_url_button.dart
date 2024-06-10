import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LaunchUrlButton extends StatelessWidget {
  const LaunchUrlButton({super.key, required this.urlString, this.child});

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
