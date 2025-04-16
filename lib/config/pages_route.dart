enum PagesRoute {
  firstPage("/", "First Page"),
  secondPage("/second", "Second Page"),
  thirdPage("/cubit", "Cubit Page"),
  authPage("/auth", "Auth Page");

  const PagesRoute(this.path, this.name);
  final String path;
  final String name;
}
