class Entity {
  final String directory;
  final bool isDoc;
  final String path;
  final int size;
  Entity(
      {required this.path,
      required this.directory,
      required this.isDoc,
      required this.size});
}
