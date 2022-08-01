
import 'package:flutter/material.dart';
import 'package:rashad_test/detail.dart';
import 'package:rashad_test/model/travel.dart';

class TravelBlog extends StatelessWidget {
  final _list = Travel.generateTravelBlog();
  final _pageCtrl = PageController(viewportFraction: 0.9);


  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageCtrl,
        itemCount: _list.length,
        itemBuilder: (context,index)
    {
      var travel = _list[index];
      return GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return DetailPage(travel: travel,);
          }));
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:10.0,right:20.0,bottom: 30.0 ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(travel.url,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),

              ),
            ),
            Positioned(
              bottom:80.0 ,
              left:15.0 ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: Text(travel.location,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text(travel.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 30.0,
              child: Container(
                width:60.0 ,
                height:60.0 ,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(30),
                ),
                child:Icon(Icons.arrow_forward,
                color: Colors.white,
                size: 30.0,) ,
              ),
            ),

          ],
        ),
      );
    });
  }
}
