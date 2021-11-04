import 'package:flutter/material.dart';

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
                      child: const LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(56, 86, 130, 100),
                        color: Color.fromRGBO(82, 151, 255, 100),
                        value: 0.5,
                        minHeight: 5,
                      ),
                    ),
                  ),
                  const Text(
                    "80GB/280GB",
                    style: TextStyle(fontSize: 15),
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
