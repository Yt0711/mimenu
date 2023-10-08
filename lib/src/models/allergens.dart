enum Allergens {
  altramuces,
  apio,
  cacahuetes,
  crustaceos,
  frutosdecascara,
  gluten,
  huevos,
  lacteos,
  moluscos,
  mostaza,
  pescado,
  sesamo,
  soja,
  sulfitos,
  unknown,
  ;

  String toMap() => name;
  static Allergens fromMap(String? json) => values.byName(json ?? 'unknown');
}
