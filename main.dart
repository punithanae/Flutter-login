import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home:MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 final  formKey=GlobalKey<FormState>();
 final  scaffoldKey=GlobalKey<ScaffoldState>();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:scaffoldKey,
      body: new Container(
      padding: EdgeInsets.all(40.0),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple,
            Colors.lightGreen
          ]
        )),
      child: Center(
        child: new Column(
          children: [
            SizedBox(
              height: 100.0,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator:(value){
                      if(value!.isEmpty){
                        return "Please enter the username";
                      }else if(value != "admin"){
                        return "Please enter the validate password";
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle,color: Colors.white),
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator:(value){
                      if(value!.isEmpty){
                        return "Please enter the Password";
                      }else if(value != "puni"){
                        return "Please enter the validate password";
                      }


                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock,color: Colors.white),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30.0,
            ),
            Container(
              decoration: BoxDecoration(),
            ),
             ElevatedButton(
                 onPressed:(){

                   if(formKey.currentState!.validate())
                   {
                     Navigator.pushReplacement(context,
                         MaterialPageRoute(builder:(context) => Login()));
                   }else{
                     scaffoldKey.currentState!.showSnackBar(SnackBar(
                       content:Text("Please check username and Password"),
                     ));
                   }
                 },


                 child:new Text("Submit"))
                    ],
        ),
      ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children:  [
        Center(
        child: Text(
          "Employee Data"

    )),
        DataTable(columns: [
          DataColumn(label: Text('No')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Salary')),
        ] , rows: [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('Punithan')),
            DataCell(Text('30000')),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('Sushmita')),
            DataCell(Text('31000')),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('Raj')),
            DataCell(Text('40000')),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Text('Ajith')),
            DataCell(Text('50000')),
          ]),
          DataRow(cells: [
            DataCell(Text('5')),
            DataCell(Text('Vijay')),
            DataCell(Text('70000')),
          ]),
                   ]

        ),
      ],

    ),
    );

  }
}


