import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Color(0xff76b5c5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

















// import 'package:flutter/material.dart';

// class ButtonWidget extends StatelessWidget {
//   final String title;
//   final bool hasBorder;

//   const ButtonWidget({required this.title, required this.hasBorder});
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Ink(
//         decoration: BoxDecoration(
//           color: hasBorder ? Colors.white : Color(0xff4A64FE),
//           borderRadius: BorderRadius.circular(10),
//           border: hasBorder
//               ? Border.all(
//                   color: Color(0xff4A64FE),
//                   width: 1,
//                 )
//               : Border.fromBorderSide(
//                   BorderSide.none,
//                 ),
//         ),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(10),
//           child: Container(
//             height: 60,
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       color: hasBorder ? Color(0xff4A64FE) : Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
