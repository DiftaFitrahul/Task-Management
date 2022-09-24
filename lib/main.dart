import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> widgets = <Widget>[];
  final _textController = TextEditingController();
  String newTask = 'mandi';
  int number = 0;

  Widget getData() {
    return Row(children: <Widget>[
      Flexible(
        flex: 1,
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(5, 12, 5, 12),
            margin: EdgeInsets.fromLTRB(15, 12, 7, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(0, 3.5),
                  blurRadius: 6,
                  spreadRadius: 3,
                )
              ],
            ),
            child: Text(number.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'roboto',
                    fontWeight: FontWeight.w400))),
      ),
      Flexible(
          flex: 6,
          child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(15, 12, 5, 12),
              margin: EdgeInsets.fromLTRB(5, 12, 25, 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(0, 3.5),
                    blurRadius: 6,
                    spreadRadius: 3,
                  )
                ],
              ),
              child: Text(
                newTask,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400),
              ))),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Task Management"),
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          ),
          body: Container(
            color: Color.fromARGB(255, 244, 248, 253),
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment(0, -1),
                    margin: EdgeInsets.fromLTRB(15, 40, 20, 50),
                    height: 175,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color.fromARGB(255, 102, 173, 248),
                              Colors.blue
                            ]),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 66, 146, 244)
                                .withOpacity(0.6),
                            offset: const Offset(1, 4),
                            blurRadius: 9,
                            spreadRadius: 2,
                          )
                        ]),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Positioned(
                          top: 10,
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 12, left: 23, right: 21),
                            child: Text("ADD Task",
                                style: TextStyle(
                                    fontFamily: 'roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 22)),
                          ),
                        ),
                        Align(
                          alignment: Alignment(1, 0.2),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Form(
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: 'roboto',
                                    fontWeight: FontWeight.w500),
                                controller: _textController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Input your Task",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        _textController.clear();
                                      },
                                      icon: const Icon(Icons.clear),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -25,
                          right: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 9, 0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        newTask = _textController.text;
                                        number++;
                                        widgets.add(getData());
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.lightBlue,
                                      elevation: 5,
                                      primary: Colors.lightBlue,
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(10),
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(9, 0, 10, 0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        widgets.removeLast();
                                        number--;
                                      });
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shadowColor:
                                          Color.fromARGB(255, 238, 48, 111),
                                      elevation: 5,
                                      primary:
                                          Color.fromARGB(255, 238, 48, 111),
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(10),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 70,
                          width: 70,
                          margin:
                              EdgeInsets.only(left: 18, bottom: 20, right: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                offset: const Offset(1, 3.5),
                                blurRadius: 6,
                                spreadRadius: 3,
                              )
                            ],

                            /*gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color.fromARGB(255, 102, 173, 248),
                                Colors.blue
                              ]),*/
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "20",
                                style: TextStyle(
                                    fontFamily: 'robotomono',
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 5),
                              Text("Sun",
                                  style: TextStyle(
                                      fontFamily: 'roboto',
                                      fontWeight: FontWeight.w400)),
                            ],
                          )),
                      Container(
                          height: 73,
                          width: 73,
                          margin: EdgeInsets.only(bottom: 20, right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color.fromARGB(255, 132, 188, 247),
                                  Color.fromARGB(255, 38, 156, 253)
                                ]),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "21",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontFamily: 'robotomono',
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 5),
                              Text("Mon",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'roboto',
                                      fontWeight: FontWeight.w400)),
                            ],
                          )),
                      Container(
                          height: 70,
                          width: 70,
                          margin: EdgeInsets.only(bottom: 20, right: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                offset: const Offset(1, 3.5),
                                blurRadius: 6,
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "22",
                                style: TextStyle(
                                    fontFamily: 'robotomono',
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 5),
                              Text("Tue",
                                  style: TextStyle(
                                      fontFamily: 'roboto',
                                      fontWeight: FontWeight.w400)),
                            ],
                          )),
                      Container(
                          height: 70,
                          width: 70,
                          margin: EdgeInsets.only(bottom: 20, right: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                offset: const Offset(1, 3.5),
                                blurRadius: 6,
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "23",
                                style: TextStyle(
                                    fontFamily: 'robotomono',
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 5),
                              Text("Wed",
                                  style: TextStyle(
                                      fontFamily: 'roboto',
                                      fontWeight: FontWeight.w400)),
                            ],
                          )),
                      Container(
                          height: 70,
                          width: 70,
                          margin: EdgeInsets.only(right: 18, bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                offset: const Offset(1, 3.5),
                                blurRadius: 6,
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "24",
                                style: TextStyle(
                                    fontFamily: 'robotomono',
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 5),
                              Text("Thur",
                                  style: TextStyle(
                                      fontFamily: 'roboto',
                                      fontWeight: FontWeight.w400)),
                            ],
                          )),
                    ]),
                Flexible(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: widgets,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
