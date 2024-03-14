import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:hopewell/common/values/app_colors.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(child: Image.asset("assets/logo/404_error.png")),
    // );
    return Scaffold(
      backgroundColor: AppColors.mojito,
      appBar: AppBar(
        title: Text("Article"),
      ),
      body: PDF(swipeHorizontal: false).cachedFromUrl(
          "https://ginasthma.org/wp-content/uploads/2023/07/GINA-2023-Pocket-Guide-WMS.pdf"),
    );
  }
}
