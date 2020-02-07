import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class AppLocalization {



  static Future<AppLocalization> load(Locale locale) {
    // final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = "es"; //Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalization();
    });
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  String get email {
    return Intl.message(
      'email',
    );
  }

  String get onBoardingMessage1 {
    return Intl.message(
      'onBoardingMessage1',
    );
  }
  String get onBoardingMessage2 {
    return Intl.message(
      'onBoardingMessage2',
    );
  }

  String get start {
    return Intl.message(
      'start',
    );
  }
  String get information {
    return Intl.message(
      'information',
    );
  }

}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  final Locale overriddenLocale;

  const AppLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => ['es'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}
