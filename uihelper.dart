
import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextButton({  required VoidCallback callback,required String text}){
    return TextButton(onPressed:(){callback();},child:Text(text,style: TextStyle(fontSize: 12,color:Colors.blue,)));
  }
  static customImage({required String img}){
    return Image.asset("assets/images/$img");
  }

  static CustomButton({
    required VoidCallback callback,
    required String buttonname,
  }) {
    return SizedBox(
      height: 35,
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          callback();
        },
        child: Text(
          buttonname,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }

  static CustomText({
    required String text,
    required double height,
    Color? color,
    FontWeight? fontweight,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: height,
        color: color ?? Color(0xff5E5E5E),
        fontWeight: fontweight,
      ),
    );
  }

  static CustomTextField({ required TextEditingController controller,required bool tohide, required String text,required TextInputType textinputtype,required TextInputAction textinputaction}){ 
    return Container(
      height: 40,
      width:  350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 4, 2, 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(style: TextStyle(color : Colors.white,),
          
          controller: controller,
          obscureText: tohide,
          keyboardType: textinputtype,
          textInputAction: textinputaction, 
        
          decoration: InputDecoration(hintText:text,hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,color: Colors.white), border:  InputBorder.none ,),
        ),
      ),
    );  
}
}
//uihelper.dart