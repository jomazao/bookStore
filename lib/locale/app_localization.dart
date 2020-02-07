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
  String get price {
    return Intl.message(
      'price',
    );
  }

  String get raiting {
    return Intl.message(
      'raiting',
    );
  }

  String get author {
    return Intl.message(
      'author',
    );
  }
  String get publisher {
    return Intl.message(
      'publisher',
    );
  }

  String get pages {
    return Intl.message(
      'pages',
    );
  }

  String get language {
    return Intl.message(
      'language',
    );
  }

  String get isbn10 {
    return Intl.message(
      'isbn10',
    );
  }

  String get isbn13 {
    return Intl.message(
      'isbn13',
    );
  }

  String get description {
    return Intl.message(
      'description',
    );
  }  String get noMoreBooks {
    return Intl.message(
      'noMoreBooks',
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
