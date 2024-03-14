import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopewell/common/values/app_colors.dart';
import 'package:hopewell/common/widgets/flutter_toast.dart';
import 'package:hopewell/pages/home/bloc/home_bloc.dart';
import 'package:hopewell/pages/home/home_controller.dart';
import 'package:hopewell/pages/home/widgets/home_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController homeC;

  @override
  void initState() {
    super.initState();
    homeC = HomeController(context: context);
    homeC.init();
    print(homeC.userProfile!.toJson());
    //trigger event after init
  }

  @override
  Widget build(BuildContext context) {
    return homeC.userProfile != null
        ? Scaffold(
            backgroundColor: AppColors.mojito,
            appBar: buildAppBar(homeC.userProfile!.avatar ?? ""),
            body: BlocBuilder<HomeBloc, HomeStates>(
              builder: (context, state) {
                print("State Thumbnail ${state.thumbnail.length}");
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          decoration: BoxDecoration(
                            color: AppColors.cambridgeBlue,
                            borderRadius: BorderRadius.circular(20.h),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              homePageText("Halo",
                                  color: AppColors.primaryText),
                              homePageText(homeC.userProfile!.name.toString(),
                                  color: AppColors.primaryText, top: 0),
                              const Text("Jadwal mendatang"),
                              Container(
                                margin: EdgeInsets.only(top: 5.h),
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                height: 125,
                                decoration: BoxDecoration(
                                  color: AppColors.celadon,
                                  borderRadius: BorderRadius.circular(20.h),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              child: SizedBox(
                                                height: 25,
                                                width: 25,
                                                child: Image.asset(
                                                    "assets/icons/person.png"),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 10.w),
                                              child: const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Nama terapis"),
                                                  Text("Keahlian terapis"),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20.h),
                                            ),
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              height: 25,
                                              width: 25,
                                              child: Image.asset(
                                                "assets/icons/phone-call.png",
                                              ),
                                            ))
                                      ],
                                    ),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: AppColors.mojito,
                                        borderRadius:
                                            BorderRadius.circular(20.h),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("Senin, 1 Januari 2024"),
                                          Text("10.00 - 12.00"),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                      // SliverToBoxAdapter(
                      //   child: searchView(),
                      // ),
                      // SliverToBoxAdapter(
                      //   child: slidersView(context, state),
                      // ),
                      SliverToBoxAdapter(
                        child: menuView(),
                      ),
                      SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                      SliverList(
                          delegate: SliverChildListDelegate(
                              List.generate(state.listVideo.length, (index) {
                        var data = state.listVideo[index];
                        return GestureDetector(
                          onTap: () {
                            toastInfo(msg: "Redirecting...");
                            launchUrl(
                              Uri.parse(homeC.urlVideos[index]),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          child: Container(
                            height: 200,
                            margin: EdgeInsets.only(bottom: 10.h),
                            decoration: BoxDecoration(
                                color: AppColors.beige,
                                borderRadius: BorderRadius.circular(10.h)),
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.h)),
                                  child: Image.network(
                                    data.thumbnailUrl.toString(),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Text(
                                  data.title.toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        );
                      }))),
                      // SliverToBoxAdapter(
                      //   child: CarouselSlider(
                      //     items: state.listVideo
                      //         .map((data) => Stack(
                      //               children: [
                      //                 Container(
                      //                   height: 300,
                      //                   width:
                      //                       MediaQuery.of(context).size.width,
                      //                   color: AppColors.beige,
                      //                   child: Image.network(
                      //                     data.thumbnailUrl.toString(),
                      //                     fit: BoxFit.fill,
                      //                   ),
                      //                 )
                      //               ],
                      //             ))
                      //         .toList(),
                      //     options: CarouselOptions(
                      //       // autoPlayInterval: const Duration(seconds: 5),
                      //       // autoPlay: true,
                      //       viewportFraction: 1,
                      //       enlargeCenterPage: false,
                      //     ),
                      //   ),
                      // ),
                      // SliverPadding(
                      //   padding: EdgeInsets.symmetric(
                      //       vertical: 18.h, horizontal: 0.w),
                      //   sliver: SliverGrid(
                      //     gridDelegate:
                      //         const SliverGridDelegateWithFixedCrossAxisCount(
                      //       crossAxisCount: 2,
                      //       mainAxisSpacing: 15,
                      //       crossAxisSpacing: 15,
                      //       childAspectRatio: 1.6,
                      //     ),
                      //     delegate: SliverChildBuilderDelegate(
                      //       childCount: state.courseItem.length,
                      //       (context, index) {
                      //         return GestureDetector(
                      //           onTap: () {},
                      //           child: courseGrid(state.courseItem[index]),
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
            ))
        : Container();
  }
}
