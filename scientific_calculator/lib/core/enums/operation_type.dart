enum OperationType {
  add('+'),

  subtract('-'),

  multiply('×'),

  divide('÷'),

  modulo('%'),

  power('^'),

  square('x²'),

  cube('x³'),

  squareRoot('√'),

  cubeRoot('∛'),

  reciprocal('1/x'),

  factorial('!'),

  sine('sin'),

  cosine('cos'),

  tangent('tan'),

  log('log'),

  naturalLog('ln'),

  exponent('eˣ'),

  tenPower('10ˣ'),

  pi('π'),

  euler('e');

  final String symbol;

  const OperationType(this.symbol);
}