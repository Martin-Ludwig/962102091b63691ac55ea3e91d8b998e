import 'dart:convert';

class BuildTemplate {

  int version;
  int classBitLength;
  int primaryClass;
  int secondaryClass;
  int skillBitLength;
  List<int> skillIds;


  final String testcode = "Hallo Welt.";

  /// returns a base64 string code of the encoded build
  String encode([String str = ""]) {
    String s;
    if (str.isEmpty) {
      s = testcode;
    } else {
      s = str;
    }

    var bytes = utf8.encode(str);
    var base64Str = base64.encode(bytes);
    

    return base64Str;
  }


  String decode(String base64Str) {
    var bytes = base64.decode(base64Str);
    String code = utf8.decode(bytes);

    return code;
  }

}

// test
main() {
//  var str = "Hello world";
//  var bytes = utf8.encode(str);
//  var base64Str = base64.encode(bytes);
//  print("$str -> $bytes -> $base64Str");
//
//  String bitcode = "00100100";
//
//  print(base64Decode("SGVsbG8gd29ybGQ="));
  BuildTemplate build = BuildTemplate();

  final String code = "Hallo Welt.";

  String encoded = build.encode(code);
  String decoded = build.decode(encoded);

  print("$code -> $encoded -> $decoded");

}