import 'dart:io';

import 'package:dspace/function/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';

class Tabletest extends StatefulWidget {
  final List datasource;
  final void Function(String path)? ontap;

  const Tabletest({Key? key, required this.datasource, this.ontap})
      : super(key: key);

  @override
  State<Tabletest> createState() => _TabletestState();
}

class _TabletestState extends State<Tabletest> {
  /*@override
   with AutomaticKeepAliveClientMixin<Tabletest>
  bool get wantKeepAlive => true;*/
  @override
  Widget build(BuildContext context) {
    // var b = List.generate(5, (index) => Text("hi"));
    //widget.datasource.sort();
    var newdata = widget.datasource;
    return Scaffold(
      persistentFooterButtons: const [
        Center(child: Icon(Icons.settings_outlined))
      ],
      backgroundColor: Colors.red,
      //extendBody: true,
      appBar: const AppBarr(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                //padding: EdgeInsets.only(left: 10, right: 30),
                decoration: const BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    /*SizedBox(
                      width: 10,
                    ),*/
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Center(child: Text("*")),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Flexible(flex: 4, child: Center(child: Text("File Name"))),
                    SizedBox(
                      width: 50,
                    ),
                    Flexible(
                        //fit: FlexFit.tight,
                        flex: 4,
                        child: Center(child: Text("Size"))),
                    SizedBox(
                      width: 50,
                    ),
                    Flexible(flex: 2, child: Center(child: Text("Action"))),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.transparent,
              ),
              Expanded(
                  child: ListView.separated(
                      separatorBuilder: (_, __) => const Divider(
                            //endIndent: 2,
                            color: Colors.grey,
                            height: 10,
                            thickness: 0.4,
                          ),
                      itemCount: newdata.length,
                      itemBuilder: (context, index) {
                        //var x = {}.isNotEmpty;
                        // print(newdata[index]['isDoc']);
                        return Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: newdata.isNotEmpty
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 30),
                                      child: newdata[index]['isDoc']
                                          ? const Icon(
                                              Icons.folder_open_outlined)
                                          : const Icon(
                                              Icons.file_present_outlined),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: GestureDetector(
                                        onDoubleTap: () async {
                                          print(newdata[index]['isDoc']);
                                          if (await Directory(
                                                      newdata[index]['Path'])
                                                  .exists() &&
                                              Directory(newdata[index]['Path'])
                                                  is Directory) {
                                            /*_con.nextPage(
                                          duration: Duration(seconds: 1),
                                          curve: Curves.fastOutSlowIn);*/
                                            List x = await dirs(
                                                path: newdata[index]['Path']);

                                            await Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return Tabletest(
                                                datasource: x,
                                              );
                                            }));
                                          }
                                        },
                                        child: Text(
                                          newdata[index]['Directory'],
                                          style: const TextStyle(fontSize: 15),
                                          //overflow: TextOverflow.ellipsis,
                                          //softWrap: false,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Center(
                                          child: Text(
                                        newdata[index]['Size'].toString()
                                        /*filesize(newdata[index]['Size']
                                            .toString()
                                            .trim())*/
                                        ,
                                        style: const TextStyle(fontSize: 15),
                                        overflow: TextOverflow.clip,
                                      )),
                                    ),
                                    const SizedBox(
                                      width: 100,
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: TextButton(
                                            style: ButtonStyle(
                                                foregroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.red)),
                                            onPressed: () {
                                              setState(() {
                                                newdata.removeAt(index);
                                              });
                                              /*newdata.removeAt(index);
                                              print(newdata[index]);
                                              print(newdata[index].runtimeType);
                                            */
                                            },
                                            child: const Text(
                                              'Delete',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )) /* Icon(Icons.delete_outline_rounded)*/),
                                  ],
                                )
                              : const Center(
                                  child: Text('Empty'),
                                ),
                        );
                      })

                  /* PageView.builder(
                    controller: _con,

                    */ /*addAutomaticKeepAlives: true,
                      separatorBuilder: (_, __) => const Divider(
                            color: Colors.green,
                          ),*/ /*
                    //itemCount: newdata.length,
                    itemBuilder: (context, index) {

                    }),*/
                  ),
              /*Expanded(
                  child: ListView.builder(
                      itemCount: b.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                color: Colors.white10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    b[index]
                                    // Text("yv uuryrr r rurrrr"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )*/
            ],
          ),
        ),
      ),
    );
  }
}
/*@override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<void>('Function', Function));
  }
}*/
