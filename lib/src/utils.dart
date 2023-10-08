String currencyFormat(int valueInCents) {
  return '${(valueInCents / 100).toStringAsFixed(2)} €';
}
