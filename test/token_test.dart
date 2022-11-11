void main() {
  // String input = "Ini adalah tex (e304, @872";
  // List<String> list_input = input.split(' ');
  // List<String> listDataset = ['e304', 'e403', 'e123', 'e104'];
  // String regex = ',():';

  // print(list_input);

  // List<String> output = [];
  // list_input.forEach((v) {
  //   var h = v.replaceAll(RegExp(r'[^\w\s]+'), '');
  //   if (listDataset.contains(h)) {
  //     output.add(h);
  //   }
  // });

  // print(output);
}

void testString() {
  String input = "Tes-os tes os";
  var res = input.multiSplit(['-', ' ']);

  print(res);
}

extension UtilExtensions on String {
  List<String> multiSplit(Iterable<String> delimeters) => delimeters.isEmpty
      ? [this]
      : split(RegExp(delimeters.map(RegExp.escape).join('|')));
}
