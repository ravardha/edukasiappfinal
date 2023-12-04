import 'package:cached_network_image/cached_network_image.dart';
import 'package:edukasiapp/theme/color.dart';
//import 'package:edukasiapp/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseItem extends StatelessWidget {
  CourseItem(
    {Key? key, required this.data,}) : super(key: key);
final data;
  
  @override
  Widget build(BuildContext context) {

    return Container(
          width: 200, height: 290,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 5, bottom:5),
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowColor.withOpacity(.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(1,1)
              )
            ]),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 190,
              child: CachedNetworkImage(
                imageBuilder: (context, ImageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: ImageProvider, fit: BoxFit.cover)),
                ),
                imageUrl: data["image"],
              ),
            ),
            Positioned(
              top: 175, right: 15,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.shadowColor. withOpacity(.05),
                      spreadRadius: .5,
                      blurRadius: .5,
                      offset: Offset(1, 1),)
                  ]),
              child: SvgPicture.asset(
                "assets/icons/bookmark.svg",
                color: AppColor.primary,
                width: 25, height: 25,
              ))),
            Positioned(
              top: 215,
              child: Container(
                width: MediaQuery.of(context).size.width - 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["name"],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getAttribut(Icons.sell_outlined, 
                          data["price"], AppColor.labelColor),
                        getAttribut(Icons.play_circle_outline, 
                          data["session"], AppColor.labelColor),
                        getAttribut(Icons.schedule_outlined, 
                          data["duration"], AppColor.labelColor),
                        getAttribut(Icons.star, 
                          data["review"].toString(), AppColor.yellow), 
                      ],
                    )
                  ],
                ),
              ))
          ],
        ),
      );
  }

  getAttribut(IconData icon, String name, Color color){
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        SizedBox( width: 5,),
        Text(
          name,
          style: TextStyle(fontSize: 13, color: AppColor.labelColor),
        )
      ],);
  }
  
}