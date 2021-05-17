import 'package:flutter/material.dart';
import '../Classes/user.dart';

// class InfoBlockWidget extends StatelessWidget {
//   final String infoName;
//   final String info;

//   InfoBlockWidget({
//     @required this.infoName,
//     @required this.info,
//   });

//   // InfoBlockWidget(arg1, arg2) {
//   //   this._infoName = arg1;
//   //   this._info = arg2;
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Center(
//               child: Text(
//             infoName,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           )),
//           Center(
//               child: Text(
//             info,
//             style: TextStyle(fontSize: 18),
//           )),
//         ],
//       ),
//     );
//   }
// }

class UserScreen extends StatelessWidget {
  static const routeName = '/user-screen';

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments as User;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(user.name),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 3.0),
                        bottom: BorderSide(width: 3.0))),
                child: Column(children: <Widget>[
                  Center(
                      child: Text(
                    "STUDENT NUMBER:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  Center(
                      child: Text(
                    user.studentNum,
                    style: TextStyle(fontSize: 18),
                  )),
                ])),
            ///////NEW ITEM
            Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 3.0),
                        bottom: BorderSide(width: 3.0))),
                child: Column(children: <Widget>[
                  Center(
                      child: Text(
                    "EMAIL ADDRESS:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  Center(
                      child: Text(
                    user.email,
                    style: TextStyle(fontSize: 18),
                  )),
                ])),
            ///////NEW ITEM
            Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 3.0),
                        bottom: BorderSide(width: 3.0))),
                child: Column(children: <Widget>[
                  Center(
                      child: Text(
                    "POINTS:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  Center(
                      child: Text(
                    user.points.toString(),
                    style: TextStyle(fontSize: 18),
                  )),
                ])),
            ///////NEW ITEM
            Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 3.0),
                        bottom: BorderSide(width: 3.0))),
                child: Column(children: <Widget>[
                  Center(
                      child: Text(
                    "LIST OF COMPLETED CHALLENGES:",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )),
                  user.completed.isEmpty
                      ? Center(
                          child: Text(
                          "No challenges completed yet",
                          style: TextStyle(fontSize: 18),
                        ))
                      : Column(
                          children: <Widget>[
                            ...user.completed.map((element) {
                              return InkWell(
                                splashColor: Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                                child: Card(
                                  elevation: 1,
                                  color: Theme.of(context).primaryColor,
                                  child: ListTile(
                                    title: Text('ss',
                                      //element.challenge.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                ])),

            // InfoBlockWidget(infoName: "STUNUM", info: user.studentNum)
          ],
        ));
  }
}
