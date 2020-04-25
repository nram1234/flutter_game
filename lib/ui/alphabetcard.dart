import 'dart:math';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alphabetcard extends StatefulWidget {
  @override
  _AlphabetcardState createState() => _AlphabetcardState();
}

class _AlphabetcardState extends State<Alphabetcard> {
  Map<String, bool> score = {};
  int index = 0;
  List number = [];
  List<mydatatype> view = [];

  @override
  void initState() {
    getrandomnumber();
  }

//  Map<String, String> choices = {
//    'a': 'A',
//    'b': 'B',
//    'c': 'C',
//    'd': 'D',
//    'e': 'E',
//    'f': 'F',
//    'g': 'G',
//    'h': 'H',
//    'j': 'J',
//    'k': 'K',
//    'l': 'L',
//    'm': 'M',
//    'n': 'N',
//    'o': 'O',
//    'p': 'P',
//    'q': 'Q',
//    'r': 'R',
//    's': 'S',
//    't': 'T',
//    'u': 'U',
//    'v': 'V',
//    'w': 'W',
//    'x': 'X',
//    'y': 'Y',
//    'z': 'Z',
//  };
  List<mydatatype> ii = [
    mydatatype('assets/images/a.png', 'assets/images/apple.png'),
    mydatatype('assets/images/p.png', 'assets/images/ball.png'),
    mydatatype('assets/images/c.png', 'assets/images/car.png'),
    mydatatype('assets/images/d.png', 'assets/images/duck.png'),
    mydatatype('assets/images/e.png', 'assets/images/eggplant.png'),
    mydatatype('assets/images/f.png', 'assets/images/fire.png'),
    mydatatype('assets/images/g.png', 'assets/images/goat.png'),
    mydatatype('assets/images/h.png', 'assets/images/hamburger.png'),
    mydatatype('assets/images/j.png', 'assets/images/jelly.png'),
    mydatatype('assets/images/k.png', 'assets/images/kite.png'),
    mydatatype('assets/images/l.png', 'assets/images/leaf.png'),
    mydatatype('assets/images/m.png', 'assets/images/mitten.png'),
    mydatatype('assets/images/n.png', 'assets/images/nest.png'),
    mydatatype('assets/images/o.png', 'assets/images/oven.png'),
    mydatatype('assets/images/p.png', 'assets/images/pizza.png'),
    mydatatype('assets/images/q.png', 'assets/images/quarter.png'),
    mydatatype('assets/images/r.png', 'assets/images/rabbit.png'),
    mydatatype('assets/images/s.png', 'assets/images/sock.png'),
    mydatatype('assets/images/t.png', 'assets/images/turkey.png'),
    mydatatype('assets/images/u.png', 'assets/images/umbrella.png'),
    mydatatype('assets/images/v.png', 'assets/images/vest.png'),
    mydatatype('assets/images/w.png', 'assets/images/watch.png'),
    mydatatype('assets/images/x.png', 'assets/images/xray.png'),
    mydatatype('assets/images/y.png', 'assets/images/yoyo.png'),
    mydatatype('assets/images/z.png', 'assets/images/zipper.png'),
  ];

  void getrandomnumber() {

    final _random = new Random();
    number.clear();
    view.clear();
    score.clear();
    for (int i = 0; i < 7; i++) {
      number.add(_random.nextInt(ii.length - 1));
    }
    for (int o = 0; o < number.length; o++) {
      view.add(ii[number[o]]);

    }
  }
  String me='0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('جودي شطره'),centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                getrandomnumber();
                setState(() {});
              })
        ],
      ),
      body: SafeArea(
        top: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
                children: view.map((item) {
                  return card(item.key, context);
                }).toList()),
            Column(
                children: view.map((item) {
                  return card2(item.val, context);
                }).toList()
                  ..shuffle(Random(ii.length))),
          ],
        ),
      ),
    );
  }

  Widget card(dataa, context) {

    var high = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Draggable<String>(
      child: score[dataa.toString()]==true ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          child: Container(
            width: width * .25,
            height: high * .1,
            color: Colors.deepOrange,
            child: Center(
              child: Text(
                'شاطره يا جودي',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ):Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width * .25,
          height: high * .1,
          color: Colors.blue,

            child:Image.asset(dataa),

        ),
      ),
      feedback: Material(
        child: Container(
          width: width * .25,
          height: high * .1,
          color: Colors.deepOrange,
          child: Image.asset(dataa),
        ),
      ),
      childWhenDragging: Container(
        color: Colors.blue,
        child:Image.asset(dataa),
      ),
      data: dataa,
    );
  }

  Widget card2(dataa, context) {
    var high = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  DragTarget<String>(builder: (context,incoming,rejected){
      if(score[dataa]==true){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            child: Container(
              width: width * .25,
              height: high * .1,
              color: Colors.deepOrange,
              child: Center(
                child: Text(
                  'شاطره يا جودي',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      }else{
        return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            child: Container(
              width: width * .25,
              height: high * .1,
              color: Colors.blue,
              child:Image.asset(dataa),
            ),
          ),
        );
      }
    },onWillAccept: (data){
      print(data[14]);
      if(data[14]==dataa[14]){
       // ii[dataa].key= ii[dataa].val;
        return true;
      }else{

        return false;
      }

    },onAccept: (data){

      setState(() {
        score[dataa]=true;

      });
      if( score.length==5){

        //    audioPlayer.play('assets/sound/oo.mp3');
      }
    },onLeave: (data){

    },);
  }
}

class mydatatype {
  String key;
  String val;

  mydatatype(this.key, this.val);
}
