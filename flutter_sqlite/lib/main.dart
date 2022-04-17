import 'package:flutter/material.dart';
import 'package:flutter_sqlite/databse_helper.dart';

final TextEditingController _namecontroller = TextEditingController();
final TextEditingController _updateNamecontroller = TextEditingController();
final TextEditingController _updateIdcontroller = TextEditingController();

void main() => runApp(MaterialApp(home: HomePage(),));

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sqlflite Example'),),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _namecontroller,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
              keyboardType: TextInputType.name,
              autofillHints: [AutofillHints.name],
              //obscureText: false,
            ),
            /*TextFormField(
              controller: _updateIdcontroller,
              decoration: InputDecoration(
                hintText: 'Update Id',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
              keyboardType: TextInputType.name,
              autofillHints: [AutofillHints.name],
              //obscureText: false,
            ),*/
            TextFormField(
              controller: _updateNamecontroller,
              decoration: InputDecoration(
                hintText: 'Update Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
              keyboardType: TextInputType.name,
              autofillHints: [AutofillHints.name],
              //obscureText: false,
            ),
            FlatButton(
              onPressed: () async{
                int i = await DatabaseHelper.instance.insert(
                    {
                      DatabaseHelper.columnName: _namecontroller.text.toString()
                    }
                );
                print('the inserted id is $i');
              },
              child: Text('insert'),
              color: Colors.lightGreen,
            ),

            FlatButton(
              onPressed: () async{
                List<Map<String,dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
                print(queryRows);
              },
              child: Text('query'),
              color: Colors.red,
            ),

            FlatButton(
              onPressed: () async{
                int updatedId = await DatabaseHelper.instance.update(
                    {
                      DatabaseHelper.columnId: 12,
                      DatabaseHelper.columnName: _updateNamecontroller.text.toString()
                    }
                );
                print(updatedId.toString());
              },
              child: Text('update'),
              color: Colors.blue,
            ),

            FlatButton(
              onPressed: () async{
                int rowsEffected = await DatabaseHelper.instance.delete(5);
                print(rowsEffected);
              },
              child: Text('delete'),
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}

