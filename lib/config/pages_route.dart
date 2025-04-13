// @TODO: Keep the configuration in separate files
enum PagesRoute {
  // @TODO: Double quote the enum values
  firstPage('/', 'First Page'),
  secondPage('/second', 'Second Page');

  const PagesRoute(this.path, this.name);
  final String path;
  final String name;
}
