enum CalculatorMode {
  basic(
    title: 'Basic',
    columns: 4,
  ),

  scientific(
    title: 'Scientific',
    columns: 6,
  );

  final String title;
  final int columns;

  const CalculatorMode({
    required this.title,
    required this.columns,
  });
}