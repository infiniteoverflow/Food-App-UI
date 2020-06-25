import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  DetailsPage({Key key,this.heroTag,this.foodName,this.foodPrice}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  var selectedCard = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[200],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {

          },
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "Details"
        ),
        centerTitle: true,

        actions: [
          IconButton(
            icon:Icon(Icons.more_horiz),
            color: Colors.white,
            onPressed: () {

            },
          ),
        ],
      ),

      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height:MediaQuery.of(context).size.height - 85,
                width: MediaQuery.of(context).size.width,
                color:Colors.transparent,
              ),

              Positioned(
                top: 75,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                  ),
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                ),
              ),

              Positioned(
                top: 30,
                left: (MediaQuery.of(context).size.width/2)-75,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          widget.heroTag
                        )
                      ),
                    ),
                    height: 150,
                    width: 150,
                  ),
                ),
              ),

              Positioned(
                top: 210,
                left: 20,
                child:Container(
                  child: Text(
                    "${widget.foodName}",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              Positioned(
                top:260,
                left: 25,
                right: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Rs. ${widget.foodPrice}",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey[700]
                        ),
                      ),
                    ),

                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(20)
                      ),
                      height: 50,
                      width: 150,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),

                          Text(
                            "1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15
                            ),
                          ),

                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              height: 25,
                              width: 25,
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 25,
                                ),
                              )
                            ),
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),

              Positioned(
                top: 350,
                right: 10,
                left: 10,
                child: Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _scrollWidget('WEIGHT','300','G'),
                      SizedBox(width:10),
                      _scrollWidget('CALORIES','267','CAL'),
                      SizedBox(width:10),
                      _scrollWidget('VITAMINS','A,B6','VIT'),
                      SizedBox(width:10),
                      _scrollWidget('AVAIL','NO','AV'),
                      SizedBox(width:10),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _scrollWidget(String cardTitle,String info,String unit) {
    return InkWell(
      onTap: () {
        selectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardTitle == selectedCard ? Colors.amber[200] : Colors.white,
          border: Border.all(
            color:cardTitle == selectedCard ? Colors.black : Colors.grey.withOpacity(0.3),
            style: BorderStyle.solid,
            width: 0.75
          )
        ),
        height: 100,
        width: 120,
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  cardTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: cardTitle == selectedCard? Colors.black : Colors.grey[600]
                  ),
                ),
              ),
              
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "$info\n$unit",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: cardTitle == selectedCard? Colors.black : Colors.grey[600]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectCard(String cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}