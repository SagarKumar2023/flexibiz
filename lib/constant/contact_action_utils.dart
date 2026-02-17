import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactActionUtils {

  ///  Copy to Clipboard
  static void copyToClipboard(BuildContext context, dynamic item) {
    final String copyText = '''
    COMPANY : ${item.company ?? '-'}
    CONTACT : ${item.contact ?? '-'}
    DATE : ${item.date ?? '-'}
    MAIL : ${item.email ?? '-'}
    MOBILE : ${item.phone ?? '-'}
    ''';

    Clipboard.setData(ClipboardData(text: copyText));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Copied to clipboard")),
    );
  }

  /// Phone Call
  static Future<void> makePhoneCall(String? phone) async {
    if (phone == null || phone.trim().isEmpty) return;

    final cleanPhone = phone.replaceAll(RegExp(r'[^0-9+]'), '');

    final Uri uri = Uri.parse('tel:$cleanPhone');

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  /// Email
  static Future<void> sendEmail(String? email) async {
    if (email == null || email.trim().isEmpty) return;

    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Regarding Your Inquiry',
      },
    );

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  /// SMS
  static Future<void> sendSMS(String? phone) async {
    if (phone == null || phone.trim().isEmpty) return;

    final cleanPhone = phone.replaceAll(RegExp(r'[^0-9+]'), '');

    final Uri uri = Uri.parse('sms:$cleanPhone');

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<void> openWebsite(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
