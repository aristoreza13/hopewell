import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopewell/common/entities/doctor.dart';
import 'package:hopewell/common/values/app_colors.dart';
import 'package:hopewell/common/widgets/flutter_toast.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

Container buildHeaderSearch(BuildContext context) {
  return Container(
    height: 100,
    width: MediaQuery.of(context).size.width,
    color: AppColors.mojito,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Text(
                "Cari Fisioterapis terdekat",
                style: GoogleFonts.robotoMono(fontSize: 20),
                maxLines: 2,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Lottie.asset("assets/lottie/search_map.json"),
            ),
          ],
        ),
      ),
    ),
  );
}

Flexible buildListTherapist(BuildContext context, List<DoctorData> doctor) {
  return Flexible(
    child: ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: doctor.length,
      itemBuilder: (context, index) {
        return Card(
          color: AppColors.creme,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: SizedBox(
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    "assets/icons/person.png",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(doctor[index].name.toString()),
                      doctor[index].phone == null
                          ? Text("-")
                          : Text("+${doctor[index].phone.toString()}"),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          "assets/icons/call.png",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          toastInfo(msg: "Redirecting to Whatsapp");
                          launchUrl(
                            Uri.parse(
                                "https://wa.me/+${doctor[index].phone}/?text=${Uri.parse("Hello")}"),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            "assets/icons/contact.png",
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
