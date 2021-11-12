import 'package:dspace/function/functions.dart';
import 'package:dspace/widgets/tab.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List dir = [];
  @override
  void initState() {
    _();
    super.initState();
  }

  void _() async {
    dir = await dirs('');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // var x = NavigatorState().canPop();
    // ModalRoute.of(context)?.isFirst;
    // print(ModalRoute.of(context)?.isFirst);
    //var datasource = FilesEntry(dir);

    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.red.withOpacity(0.4),
      child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              //color: Colors.blue.withOpacity(0.4),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: dir.isNotEmpty
              ? Tabletest(
                  datasource: dir,
                )
              : const Center(child: CircularProgressIndicator())
          /*Row(
                  children: [
                    Text(
                      dir[index]['Directory'],
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Center(
                      child: Text(
                        dir[index]['Path'],
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Center(
                        child: Text(
                      dir[index]['Size'].toString(),
                      overflow: TextOverflow.clip,
                    )),
                  ],
                );*/

          ),
    );
  }
}
/*Scaffold(
      //extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red.withOpacity(0.4),
          // foregroundColor: Colors.red.withOpacity(0.4),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Home",
                style: TextStyle(fontSize: 25),
              ),
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
          )),
      body:*/
