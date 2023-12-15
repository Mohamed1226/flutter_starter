// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `v_required`
  String get v_required {
    return Intl.message(
      'v_required',
      name: 'v_required',
      desc: '',
      args: [],
    );
  }

  /// `whatapp_text`
  String get whatapp_text {
    return Intl.message(
      'whatapp_text',
      name: 'whatapp_text',
      desc: '',
      args: [],
    );
  }

  /// `cancel_choice`
  String get cancel_choice {
    return Intl.message(
      'cancel_choice',
      name: 'cancel_choice',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get delete {
    return Intl.message(
      'delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `ok`
  String get ok {
    return Intl.message(
      'ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `seem_it_has_connection_error`
  String get seem_it_has_connection_error {
    return Intl.message(
      'seem_it_has_connection_error',
      name: 'seem_it_has_connection_error',
      desc: '',
      args: [],
    );
  }

  /// `retry`
  String get retry {
    return Intl.message(
      'retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `success_process`
  String get success_process {
    return Intl.message(
      'success_process',
      name: 'success_process',
      desc: '',
      args: [],
    );
  }

  /// `soon`
  String get soon {
    return Intl.message(
      'soon',
      name: 'soon',
      desc: '',
      args: [],
    );
  }

  /// `errer_message`
  String get errer_message {
    return Intl.message(
      'errer_message',
      name: 'errer_message',
      desc: '',
      args: [],
    );
  }

  /// `if you want to change language just press this button`
  String get change_lang_desc {
    return Intl.message(
      'if you want to change language just press this button',
      name: 'change_lang_desc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
