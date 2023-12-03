import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app_localization/app_localization.dart';

class SharingUtils {
  const SharingUtils._();

  static SharingUtils get instance => SharingUtils._();

  unFocusTextField(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  Future<bool> sendSmsMessage({required String phoneNumber}) {
    return launch(
      'sms:$phoneNumber',
    );
  }

  Future<bool?> openWhatsApp({required String phoneNumber, String? msg}) async {
    var message = AppLocalize.gen.whatapp_text;
    if (msg != null) message = msg;
    var whatsappUrl =
        "https://api.whatsapp.com/send?phone=$phoneNumber&text=${message}";

    if (await canLaunch(whatsappUrl)) {
      return await launch(whatsappUrl);
    } else {
      return null;
    }
  }

  Future<bool> phoneCall({required String phoneNumber}) {
    return launch(
      'tel:$phoneNumber',
    );
  }

  Future<bool?> sendMail(
      {required String email,
      required String subject,
      required String body}) async {
    String myEmail = Uri.encodeComponent(email);

    subject = Uri.encodeComponent(subject);

    body = Uri.encodeComponent(body);

    Uri mail = Uri.parse("mailto:$myEmail?subject=$subject&body=$body");
    if (await launchUrl(mail)) {
      return true;
    } else {
      return null;
    }
  }

  Future<bool?> launchURLBrowser({required String url}) async {
    url = _addHttpIfAbsent(url);
    if (await canLaunch(url)) {
      return await launch(url);
    } else {
      return null;
    }
  }

  Future<bool?> launchURLApp({required String url}) async {
    url = _addHttpIfAbsent(url);
    if (await canLaunch(url)) {
      final o = await launch(url,
          forceSafariVC: true,
          forceWebView: true,
          enableJavaScript: true,
          statusBarBrightness: Brightness.light);
      return o;
    } else {
      return null;
      // throw 'Could not launch $url';
    }
  }

  String _addHttpIfAbsent(String url) {
    if (url.isNotEmpty && !url.startsWith('http')) {
      url = 'https://$url';
      return url;
    }
    return url;
  }
}
