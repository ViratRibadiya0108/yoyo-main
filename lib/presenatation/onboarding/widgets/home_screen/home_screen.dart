import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebaseconnection/core/constants/app_constants.dart';
import 'package:firebaseconnection/core/constants/provaider/auth_provaider.dart';
import 'package:firebaseconnection/core/constants/provaider/category_provider.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/home_screen/cart_screen.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/home_screen/home_product_gridview.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/home_screen/carousel_component_homescreen.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/home_screen/category_listview.dart';
import 'package:firebaseconnection/presenatation/image_index_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  final items = 10;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).getAllCategories();
    Provider.of<CategoryProvider>(context, listen: false).productApi();
    tabController = TabController(length: 2, vsync: this);
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context, listen: false);

    final screenHeight = MediaQuery.of(context).size.height;

    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.yellow,
          ),
          title: const Column(
            children: [
              Text(
                'Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'sName',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const CartScreen(),));
            },
       
  child: const Icon(
    Icons.search,
    size: 35,
  ),
),


            InkWell(
              onTap: () async {
                await authProvider.homeScreen(context);
              },
              child: const Icon(
                Icons.notifications_none_outlined,
                size: 35,
              ),
            )
          ],
          bottom: TabBar(
            tabs: const [
              Tab(
                text: 'Home',
              ),
              Tab(
                text: 'Category',
              )
            ],
            controller: tabController,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: TabBarView(
            controller: tabController,
            children: [
              Center(
                  child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: 8,
                    options: CarouselOptions(
                      height: screenHeight * 0.23,
                      autoPlay: true,
                      autoPlayCurve: Curves.ease,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1100),
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index; // Update the current index
                        });
                      },
                    ),
                    itemBuilder: (context, index, realIndexx) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: CarouselComponentHomescreen(
                        homeOnbording: HomesceenOnbordingSlideData
                            .homeonbordingSlide[index],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(8, (index) {
                      bool isActive = _currentIndex == index;
                      return ImageIndexIndicator(isActive: isActive);
                    }).toList(),
                  ),
                  Expanded(
                    // Wrap GridView with Expanded
                    child: Consumer<CategoryProvider>(
                        builder: (context, allCatagory, child) {
                      return HomeProductGridview(allCatagory: allCatagory);
                    }),
                  )
                ],
              )),
              Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Consumer<CategoryProvider>(
                          builder: (context, cetegariDate, child) {
                        return CategoryListview(cetegariDate: cetegariDate);
                      }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
