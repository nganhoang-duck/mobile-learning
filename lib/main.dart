import "package:flutter/material.dart";
main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Chương trình đầu tiên",
      home: Scaffold(
        appBar: AppBar(
          title: Text("The first program"),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              onPressed: (){
                print("Send your email");
              },
              icon: new Icon(Icons.mail),
            )
          ]
        ),

        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 25,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Tư vấn",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                leading: Icon(Icons.support_agent),
              ),
              ListTile(
                title: Text(
                  "Hỗ trợ",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                leading: Icon(Icons.help_center_outlined),
              )
            ],
          ),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ĐẠI HỌC ĐẠI NAM",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.pink,
                ),
              ),
              Text(
                "Học để thay đổi",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          elevation: 8.0,
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
          onPressed: (){
            print("Floating Button");
          },
        ),

        persistentFooterButtons: [
          ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.red,
            ),
            child: const Icon(Icons.clear),
          )
        ],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                label: "Name",
                icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "User",
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}