import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sampleapp/countdowntimer.dart';
import 'package:sampleapp/samplemodel.dart';
import 'package:flutter/services.dart' as services;

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool loading = true;
  List? mainlist;
  @override
  void initState() {
    super.initState();
    getlist();
  }

  getlist() async {
    setState(() {
      loading = true;
    });
    final jsondata = await services.rootBundle.loadString('assets/list.json');
    final list = await jsonDecode(jsondata) as List<dynamic>;
    mainlist = list.map((e) => SampleModel.fromJson(e)).toList();
    setState(() {
      loading = false;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: loading
              ? const CircularProgressIndicator()
              : ListView(
                  children: mainlist!
                      .map((e) => Card(
                            child: ListTile(
                                leading: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.network(
                                    e.profileImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  e.description.toString(),
                                  overflow: TextOverflow.clip,
                                ),
                                trailing: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CountDownTimer(
                                    secondsRemaining: e.timer ,
                                    whenTimeExpires: () {
                                      mainlist!.remove(e);
                                      setState(() {});
                                    },
                                  ),
                                )),
                          ))
                      .toList(),
                )
          // : ListView.builder(
          //     // cacheExtent: 9999999,
          //     // itemExtent: 99999,
          //     itemCount: mainlist!.length,
          //     itemBuilder: (context, index) {
          //       return Card(
          //         child: ListTile(
          //             leading: const SizedBox(
          //               width: 15,
          //               height: 15,
          //               // child: SizedBox(height:10),
          //               // Image.network(
          //               //   mainlist![index].profileImage,
          //               //   fit: BoxFit.cover,
          //               // ),
          //             ),
          //             title: Text(
          //               mainlist![index].description.toString(),
          //               overflow: TextOverflow.clip,
          //             ),
          //             trailing: SizedBox(
          //               width: 40,
          //               height: 40,
          //               child: CountDownTimer(
          //                 secondsRemaining: mainlist![index].timer,
          //                 whenTimeExpires: () {
          //                   mainlist!.removeAt(index);
          //                   setState(() {});
          //                 },
          //               ),
          //             )),
          //       );
          //     },
          //   ),
          ),
    );
  }
}
