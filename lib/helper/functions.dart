bool isNumeric(String s) {
  final numericRegex = RegExp(r'^\d+$');
  return numericRegex.hasMatch(s);
}
