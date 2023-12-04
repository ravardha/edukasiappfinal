import 'package:edukasiapp/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItem extends StatelessWidget{
  CategoryItem(
    {Key? key, 
      required this.data, 
      this.isActive = false,
      this.bgColor= Colors.white, 
      this.onTap,
      this.activeColor= AppColor.primary}) 
      : super(key: key);
  final data;
  final Color activeColor;
  final Color bgColor; 
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive? activeColor: bgColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(.05),
              blurRadius: .5,
              spreadRadius: .5,
              offset: Offset(1, 1))
          ]),
          child: Row(
            children: [
              SvgPicture.asset(
                data["icon"],
                color: isActive? Colors.white : AppColor.darker,
                width: 16, height: 16,
              ),
              SizedBox(width: 5,),
              Text(
                data["name"], 
                style: TextStyle(
                  color: isActive? Colors.white : AppColor.darker),
              ),
            ],
          ),
      ),
    );
  }
}