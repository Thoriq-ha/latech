void main() {
  String input = "Ini adalah tex (e304, @872";
  List<String> list_input = input.split(' ');
  List<String> listDataset = ['e304', 'e403', 'e123', 'e104'];
  String regex = ',():';

  print(list_input);

  List<String> output = [];
  list_input.forEach((v) {
    var h = v.replaceAll(RegExp(r'[^\w\s]+'), '');
    if (listDataset.contains(h)) {
      output.add(h);
    }
  });

  print(output);
}
