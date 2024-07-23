import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/home/widget/home_app_bar.dart';
import 'package:ecommerce/screens/home/widget/image_slider.dart';
import 'package:ecommerce/screens/home/widget/model/category.dart';
import 'package:ecommerce/screens/home/widget/model/product.dart';
import 'package:ecommerce/screens/home/widget/product_cart.dart';
import 'package:ecommerce/screens/home/widget/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategories = [
      allProduct,
      shoes,
      beauty,
      womenFashion,
      jewelry,
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
              ),
              CustomAppBar(),
              SizedBox(
                height: 20,
              ),
              MySearchBar(),
              SizedBox(
                height: 20,
              ),
              ImageSlider(
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
                currentSlide: currentSlider,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedIndex == index
                              ? Colors.blue[200]
                              : Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage(categories[index].image),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              categories[index].title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black54),
                  ),
                ],
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.78,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,),
                  itemCount: selectedCategories[selectedIndex].length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                        product: selectedCategories[selectedIndex][index]
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
