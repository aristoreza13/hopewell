import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/logo/404_error.png")),
    );
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Container(
    //         height: 100,
    //         width: MediaQuery.of(context).size.width,
    //         color: AppColors.beige,
    //         alignment: Alignment.bottomLeft,
    //         padding: EdgeInsets.symmetric(horizontal: 20.w),
    //         child: Text(
    //           "History",
    //           style: GoogleFonts.montserrat(
    //             fontSize: 32,
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         child: ListView.builder(
    //           itemCount: 15,
    //           itemBuilder: (context, index) {
    //             return ListTile(
    //               contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
    //               title: Text("Nama terapis"),
    //               subtitle: Text("Status fisioterapi"),
    //             );
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
