
enum PagesRoute {
  firstPage("/", "First Page"),
  secondPage("/second", "Second Page"),
  thirdPage("/cubit", "Cubit Page"),
  swapiPage("/swapi", "Swapi Page");

  const PagesRoute(this.path, this.name);
  final String path;
  final String name;
}
