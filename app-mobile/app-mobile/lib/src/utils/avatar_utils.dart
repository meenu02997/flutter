  String getInitials(String nameString) {
  // ignore: always_put_control_body_on_new_line
  if (nameString.isEmpty) return ' ';
  final List<String> nameArray =
      nameString.replaceAll(RegExp(r'\s+\b|\b\s'), ' ').split(' ');
  final String initials = ((nameArray[0])[0] ?? ' ') +
      (nameArray.length == 1 ? ' ' : (nameArray[nameArray.length - 1])[0]);

  return initials;
}
