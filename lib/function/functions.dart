import 'dart:io';

import 'package:dspace/model/entity.dart';

Future<List> dirs(String? path) async {
  var temp =
      Directory(path ?? await home()); // '/run/media/francis/Biggest/francis/'

  List el = [];
  await for (var e in temp.list()) {
    //print(e.path);
    // if (!(await Directory(e.path).is_empty())) {
    //Doesn't work with syslink
    //if (Directory(e.path) is Directory) {
    //print(siz.stdout);

    var fsize = await foldersize(e.path);

    //print(await FileSystemEntity.isDirectory(e.path));
    var dirname = e.path.split(Platform.pathSeparator).last;
    el.add(Entity(
        path: e.path,
        directory: dirname,
        isDoc: await FileSystemEntity.isDirectory(e.path) ? true : false,
        size: int.tryParse(fsize) as int));
    /*data.add({
      'Directory': dirname,
      'Path': e.path, //+ Platform.pathSeparator,
      'Size': int.tryParse(fsize), //?? filesize((await e.stat()).size),
      'isDoc': await FileSystemEntity.isDirectory(e.path) ? true : false,
    });*/
  }
  // }
  el.sort((b, a) => a.size.compareTo(b.size));
  return el;
}

Future home() async {
  Map env = Platform.environment;
  String home = '';
  //Map<String, String> envVars = Platform.environment;

  if (Platform.isLinux || Platform.isMacOS) {
    home = env['HOME'];
  } else if (Platform.isWindows) {
    home = env['UserProfile'];
  }
  return home;
}

Future foldersize(String path) async {
  /*var size = 0;
  if ((await FileSystemEntity.isDirectory(path)) == true) {
    await for (var e in Directory(path).list(recursive: true)) {
      size += (await e.stat()).size;
      return size;
    }*/
  var si;
  ProcessResult siz =
      (await Process.run('du', ['-sb', path])); // Get file size from system
  // si = siz.stdout.toString().split('/')[0].trim() + 'B';
  si = siz.stdout.toString().split('/')[0].trim();
  return si;
}

Future<void> delete(String path) async {
  await Directory(path).delete(recursive: true);
}
