import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:size/size.dart';

class AppBarr extends StatefulWidget implements PreferredSizeWidget {
  const AppBarr({Key? key}) : super(key: key);

  @override
  State<AppBarr> createState() => _AppBarrState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarrState extends State<AppBarr> {
  @override
  Widget build(BuildContext context) {
    Sizes _size = Sizes();
    int total_space = _size.getDiskCapacity('/home');

    ///run/media/francis/Biggest
    int avail_space = _size.getAvailableDiskSpace('/home');
    double _percent = (total_space - avail_space) / total_space;
    //print(_percent);

    return AppBar(
        // automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.red.withOpacity(0.4),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.home_outlined,
              size: 30,
            ),
            /*Text(
              "${Icon(
                Icons.home_outlined,
                size: 30,
              )}",
              style: TextStyle(fontSize: 25),
            ),*/
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 200,
                    height: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        backgroundColor: const Color.fromRGBO(56, 86, 130, 100),
                        color: const Color.fromRGBO(82, 151, 255, 100),
                        value: _percent,
                        minHeight: 5,
                      ),
                    ),
                  ),
                  Text(
                    '${filesize(avail_space)} / ${filesize(total_space)}',
                    style: const TextStyle(fontSize: 15),
                  )
                ],
              ),
            )
          ],
        ));
  }
/*Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back)),
                  ),*/
/*leading: ModalRoute.of(context)?.isFirst != true
            ? IconButton(
                onPressed: () {
                  print('Appbar ${ModalRoute.of(context)?.isFirst}');
                  setState(() {});
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))
            : Visibility(visible: false, child: Container()),*/
  /*@override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);*/
}
