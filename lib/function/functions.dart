import 'dart:io';

import 'package:filesize/filesize.dart';
import 'package:size/size.dart';

Future<List> dirs({String? path}) async {
  print(Sizes().getAvailableDiskSpace('/'));
  //print(await home());
  var temp = Directory(path ??
      await home()); // {'Directory': '', 'Path': '', 'Size': 0} '/run/media/francis/Biggest/francis/'
  List data = [];
  var fsize;
  await for (var e in temp.list()) {
    print(e.path);
    // if (!(await Directory(e.path).is_empty())) {
    //Doesn't work with syslink
    //if (Directory(e.path) is Directory) {
    //print(siz.stdout);
    fsize = await foldersize(e.path);
    // print(fsize);

    //print(await FileSystemEntity.isDirectory(e.path));
    var dirname = e.path.split(Platform.pathSeparator).last;
    data.add({
      'Directory': dirname,
      'Path': e.path + Platform.pathSeparator,
      'Size': int.tryParse(fsize), //?? filesize((await e.stat()).size),
      'isDoc': await FileSystemEntity.isDirectory(e.path) ? true : false,
    });
  }
  // }
  data.sort((b, a) => a['Size'].compareTo(b['Size']));
  data.forEach((element) {
    //print(element['Documents']);
    element['Size'] = filesize(element['Size']);
  });

  return data;
}

Future home() async {
  Map env = Platform.environment;
  String home = '';
  Map<String, String> envVars = Platform.environment;

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
