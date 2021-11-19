import 'dart:math';

class LinkGenerator {

  //Link prefix
  final _prefix = "https://rel.ink/";

  //All letter and numbers
  late List _characters;

  LinkGenerator() {
    _characters = _generateList();
  }

  //Returns all characters in the given range
  _asciiRangeGenerator(firstChar, lastChar) {
    var list = [];

    for (int i = firstChar.codeUnitAt(0); i <= lastChar.codeUnitAt(0); i++) {
      list.add(String.fromCharCodes([i]));
    }

    return list;
  }

  //combines lists
  _generateList() {
    var lowers = _asciiRangeGenerator('a', 'z');
    var uppers = _asciiRangeGenerator('A', 'Z');
    var numbers = _asciiRangeGenerator('0', '9');

    return lowers + numbers + uppers;
  }

  //Generates a random string of length 6
  _createSuffix() {
    var buffer = StringBuffer();

    int bound = _characters.length;

    var random = Random.secure();

    int numb;

    for (int i = 0; i < 6; i++) {
      numb = random.nextInt(bound);

      buffer.write(_characters[numb]);
    }

    return buffer.toString();
  }

  generateShortLink() {
    return _prefix + _createSuffix();
  }
}
