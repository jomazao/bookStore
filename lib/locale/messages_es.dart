import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

final keepAnalysisHappy = Intl.defaultLocale;

typedef MessageIfAbsent(String messageStr, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
    "email": MessageLookupByLibrary.simpleMessage("email"),
    "onBoardingMessage1": MessageLookupByLibrary.simpleMessage("Encontrarás gran variedad de libros disponibles para comprar y leer desde cualquier parte del mundo"),
    "onBoardingMessage2": MessageLookupByLibrary.simpleMessage("Obtén la información detallada de cada libro antes de hacer tu compra"),

    "start": MessageLookupByLibrary.simpleMessage("Empezar"),
    "information": MessageLookupByLibrary.simpleMessage("Información"),

    "price": MessageLookupByLibrary.simpleMessage("Precio"),
    "raiting": MessageLookupByLibrary.simpleMessage("Puntaje"),
    "authors": MessageLookupByLibrary.simpleMessage("Autores"),
    "publisher": MessageLookupByLibrary.simpleMessage("Publicador"),
    "pages": MessageLookupByLibrary.simpleMessage("Páginas"),
    "language": MessageLookupByLibrary.simpleMessage("Lenguaje"),
    "isbn10": MessageLookupByLibrary.simpleMessage("Isbn10"),
    "isbn13": MessageLookupByLibrary.simpleMessage("Isbn13"),
    "description": MessageLookupByLibrary.simpleMessage("Descripcción"),
    "noMoreBooks": MessageLookupByLibrary.simpleMessage("No hay mas libros"),

  };
}
