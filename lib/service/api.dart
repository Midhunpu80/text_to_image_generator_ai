// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:http/http.dart' as http;

String? resp;

final headesr = {
  'content-type': 'application/x-www-form-urlencoded',
  'X-RapidAPI-Key': 'ea3d193a8dmsh634a7991caff0ddp12b074jsn0999d3882f44',
  'X-RapidAPI-Host': 'open-ai21.p.rapidapi.com'
};

Future getpostimage(String text) async {
  // var data = {'text': text.toString()};
  var data = {'text': text.toString()};
  final response = await http.post(
    Uri.parse('https://open-ai21.p.rapidapi.com/texttoimage'),
    headers: headesr,
    body: data,
  );
  if (response.statusCode == 200) {
    var sata = jsonDecode(response.body.toString());
    // ignore: avoid_print
    print("sucess");
    // ignore: avoid_print
    print(
        "<=================================${sata['url']}=============================>");
    resp = sata['url'].toString();
    return sata['url'].toString();
  } else {
    print("its failed");
  }
}
