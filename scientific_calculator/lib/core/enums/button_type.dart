enum ButtonType {
  number(
    label: 'Number',
  ),

  operator(
    label: 'Operator',
  ),

  scientific(
    label: 'Scientific',
  ),

  function(
    label: 'Function',
  ),

  memory(
    label: 'Memory',
  ),

  equal(
    label: 'Equal',
  );

  final String label;

  const ButtonType({
    required this.label,
  });
}