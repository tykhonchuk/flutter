
enum PagesRoute {
  firstPage("/", "First Page"),
  secondPage("/second", "Second Page"),
  thirdPage("/cubit", "Cubit Page");

  const PagesRoute(this.path, this.name);
  final String path;
  final String name;
}
