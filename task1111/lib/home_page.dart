import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0, sum = 0;

  bool isSearching = false;
  //Dio dio = new Dio();
  bool value = false;
  //Welcome w = new Welcome();

  bool circular = true;
  TextEditingController _searchController = TextEditingController();

  int selectedRadio;

  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");

  void doAddition() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void doSub() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }

  void doMul() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void doDiv() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 ~/ num2;
    });
  }

  void doClear() {
    setState(() {
      t1.text = "0";
      t2.text = "0";
    });
  }

  final items = List<String>.generate(10000, (i) => "num $i");

  final List<String> evenList = [
    "2",
    "4",
    "6",
    "8",
    "10",
    "12",
    "14",
    "16",
    "18",
    "20",
    "22",
    "24",
    "26",
    "28",
    "30",
    "32",
    "34",
    "36",
    "38",
    "40",
    "42",
    "44",
    "46",
    "48",
    "50",
    "52",
    "54",
    "56",
    "58",
    "60",
    "62",
    "64",
    "66",
    "68",
    "70",
    "72",
    "74",
    "76",
    "78",
    "80",
    "82",
    "84",
    "86",
    "88",
    "90",
    "92",
    "94",
    "96",
    "98",
    "100"
  ];

  final List<String> oddList = [
    "1",
    "3",
    "5",
    "7",
    "9",
    "11",
    "13",
    "15",
    "17",
    "19",
    "21",
    "23",
    "25",
    "27",
    "29",
    "31",
    "33",
    "35",
    "37",
    "39",
    "41",
    "43",
    "45",
    "47",
    "49",
    "51",
    "53",
    "55",
    "57",
    "59",
    "61",
    "63",
    "65",
    "67",
    "69",
    "71",
    "73",
    "75",
    "77",
    "79",
    "81",
    "83",
    "85",
    "87",
    "89",
    "91",
    "93",
    "95",
    "97",
    "99"
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MeenuSingh Taskkk"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    child: new Text("EVEN"),
                    color: Colors.red,
                    onPressed: () {
                      _tripEditModelBottamSheet(context);
                    },
                  ),
                  new MaterialButton(
                    child: new Text("ODD"),
                    color: Colors.red,
                    onPressed: () {
                      _tripEditModelBottamSheet2(context);
                    },
                  ),
                ]),
            SizedBox(
              height: 30,
            ),
            new Text(
              "Output : $sum",
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter Number 1"),
              controller: t1,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter Number 2"),
              controller: t2,
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("+"),
                  color: Colors.greenAccent,
                  onPressed: doAddition,
                ),
                new MaterialButton(
                  child: new Text("Clear"),
                  color: Colors.greenAccent,
                  onPressed: doClear,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 5.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget getEvenListView() {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      child: ListView.builder(
        itemCount: evenList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Even num-' + evenList[index]),
            trailing: Checkbox(
                value: value,
                onChanged: (bool value) {
                  setState(() {
                    this.value = value;
                  });
                }),
          );
        },
      ),
      // height: 100,
    );
  }

  Widget getOddListView() {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      child: ListView.builder(
        itemCount: oddList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('odd num-' + oddList[index]),
            trailing: Checkbox(
                value: value,
                onChanged: (bool value) {
                  setState(() {
                    this.value = value;
                  });
                }),
          );
        },
      ),
      // height: 100,
    );
  }

  void _tripEditModelBottamSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 3.0,
            ),
            child: Container(
                height: MediaQuery.of(context).size.height * .50,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 3.0, top: 3.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Even Numbers',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                      Divider(),
                      getEvenListView(),

                      // ignore: deprecated_member_use
                    ],
                  ),
                )),
          );
        });
  }

  void _tripEditModelBottamSheet2(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 3.0,
            ),
            child: Container(
                height: MediaQuery.of(context).size.height * .50,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 3.0, top: 3.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Odd Numbers',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                      Divider(),
                      getOddListView(),

                      // ignore: deprecated_member_use
                    ],
                  ),
                )),
          );
        });
  }
}
