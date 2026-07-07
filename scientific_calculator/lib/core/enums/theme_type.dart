enum ThemeType {
  light(
    title: 'Light',
  ),

  dark(
    title: 'Dark',
  ),

  system(
    title: 'System',
  );

  final String title;

  const ThemeType({
    required this.title,
  });
}