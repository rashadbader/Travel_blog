
import 'package:flutter/material.dart';
import 'package:rashad_test/detail.dart';
import 'package:rashad_test/model/travel.dart';

class MostPopular extends StatelessWidget {
final _list = Travel.generateMostPopular();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 15.0,right:15.0 ,bottom:15.0, ),
      scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) {
          var travel = _list[index];
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder:(context){
                return DetailPage(travel: travel,);
              } ));
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(travel.url,
                  width: 140.0,
                  fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 15.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Text(travel.location,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:15.0,
                          ),)
                        ),
                        Material(
                            color: Colors.transparent,
                            child: Text(travel.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:20.0,
                                fontWeight: FontWeight.bold,
                              ),)
                        ),
                      ],
                    )),
              ],
            ),
          );
        },
        separatorBuilder: (_,index)=> SizedBox(width: 15.0,),
        itemCount: _list.length);
  }
}
