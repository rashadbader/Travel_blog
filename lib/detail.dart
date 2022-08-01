
import 'package:flutter/material.dart';
import 'package:rashad_test/model/travel.dart';

class DetailPage extends StatelessWidget {
final Travel travel ;
final double expandedHeight = 300;
final double roundedContainerHeight = 50;
DetailPage ({required this.travel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildSilversHead(),
              SliverToBoxAdapter(
                child: _buildDetail(),
              ),
            ],

          ),
          Padding(
            padding:  EdgeInsets.only(top:MediaQuery.of(context).padding.top,
            right: 15.0,left: 15.0,),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSilversHead (){
    return SliverPersistentHeader(
        delegate: DetailSliverDelegate(
          travel: travel,
          expandedHeight: expandedHeight,
          roundedContainerHeight: roundedContainerHeight,
        ));
  }
  Widget _buildDetail(){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildUserInfo(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('This Place is very good and beautifulThis Place is very good and beautifulThis Place is very good and beautifulThis Place is very good and beautifulThis Place is very good and beautiful',


            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
              height: 1.5,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Featured',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),),
                Text('View all',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),),
              ],
            ),
          ),
          SizedBox(
            height: 160.0,
            child:FeaturedWidget() ,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('This Place is very good and beautifulThis Place is very good and beautifulThis Place is very good and beautifulThis Place is very good and beautifulThis Place is very good and beautiful',


              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
                height: 1.5,
              ),),
          ),
        ],
      ),
    );
  }
  Widget _buildUserInfo(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0,),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset(travel.url,
            width: 50.0,
            height: 50.0,
            fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(travel.name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),),
                Text(travel.location,
                  style: TextStyle(
                    fontSize: 16.0,

                  ),),
              ],
            ),
          ),
          Spacer(

          ),
          Icon(Icons.share,
          color: Colors.grey,),
        ],
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate{
  final Travel travel;
  final double expandedHeight;
  final double roundedContainerHeight;
  DetailSliverDelegate({
    required this.travel,
    required this.expandedHeight,
    required this.roundedContainerHeight,
});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(opacity: 0.8,
        child: Image.asset(travel.url,
        width: MediaQuery.of(context).size.width,
        height: expandedHeight,
        fit: BoxFit.cover),),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
            left: 0,

            child: Container(
              width: MediaQuery.of(context).size.width,
              height: roundedContainerHeight,
              decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0,),
                    topRight: Radius.circular(30.0,),

                ),
              ) ,
            )),
        Positioned(
          top: expandedHeight- shrinkOffset-120,
            left : 30.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(travel.name,
            style: TextStyle(
              color: Colors.white,
              fontSize:30.0,
            ),),
            Text(travel.location,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),),
          ],
        ))

      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent =>  expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

}
class FeaturedWidget extends StatelessWidget{
  final _list = Travel.generateMostPopular();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(20.0),
      scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
        var travel = _list[index];
          return Container(

            width: 120.0,
            child: Image.asset(travel.url,
            fit: BoxFit.cover,),
          );
        },
        separatorBuilder: (_,index)=> SizedBox(width:10.0 ,),
        itemCount: _list.length,);
  }
  
}