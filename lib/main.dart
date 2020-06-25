import 'package:flutter/material.dart';
import 'package:grocery_app/detailsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.teal[400],
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top:10,bottom:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios), 
                  color: Colors.white,
                  onPressed: () {

                  }
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.filter_list), 
                      color: Colors.white,
                      onPressed: () {
                        
                      }
                    ),

                    IconButton(
                      icon: Icon(Icons.search), 
                      color: Colors.white,
                      onPressed: () {
                        
                      }
                    )
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 20,),

          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  "Healthy",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white
                  ),
                ),

                SizedBox(width:5),

                Text(
                  "Food",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                  ),
                )
              ],
            ),
          ),

          SizedBox(height:40),

          Container(
            height: MediaQuery.of(context).size.height - 185,
            padding: EdgeInsets.only(top:20,bottom:10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75)) 
            ),
            child: ListView(
              children: [
                _foodView("assets/images/food.png","Burger","75"),
                _foodView("assets/images/pizza.png","Pizza","125"),
                _foodView("assets/images/water.png","Water Bottle","25"),
                _foodView("assets/images/fruit.png","Apple","15"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _foodView(String imgPath,String name,String price) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context)=> DetailsPage(heroTag: imgPath,foodName: name,foodPrice: price,)
            )
          );
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: imgPath,
                child: Image(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover,
                  height: 75,
                  width: 75,
                ),
              ),

              SizedBox(width:10),

              Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  Text(
                    "Rs. $price",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                  )
                ],
              ),

              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
