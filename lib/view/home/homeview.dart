import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sneakers_shop_app/animations/fade_animations.dart';
import 'package:sneakers_shop_app/data/dummy_data.dart';
import 'package:sneakers_shop_app/models/shoe_model.dart';
import 'package:sneakers_shop_app/theme/custom_app_theme.dart';
import 'package:sneakers_shop_app/utils/constants.dart';

import 'components/home_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndexOfCategory = 0, selectedIndexOffeatured = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _categoryview(size),
            //SizedBox(height: size.height * 0.04),
            _mainShoesListView(size),
            _moreTextAndIcone(),
            SizedBox(
              width: size.width,
              height: size.height * 0.305,
              child: ListView.builder(
                  itemCount: availableShoes.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    ShoeModel model = availableShoes[index];
                    return Container(
                      margin: const EdgeInsets.all(8),
                      width: size.width * 0.5,
                      height: size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: -1,
                              left: 8,
                              child: FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: size.width / 13,
                                  height: size.height / 10,
                                  color: Colors.red,
                                  child: const RotatedBox(
                                    quarterTurns: -1,
                                    child: Center(
                                      child: FadeAnimation(
                                        delay: 1.5,
                                        child: Text(
                                          'New',
                                          style: AppThemes.homeGridNewText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 5,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: AppConstantsColor.darkTextColor,
                                  ),
                                  onPressed: () {},
                                )),
                            Positioned(
                              top: 60,
                              left: 10,
                              child: FadeAnimation(
                                delay: 1.5,
                                child: RotationTransition(
                                  turns:
                                      const AlwaysStoppedAnimation(-15 / 360),
                                  child: Hero(
                                    tag: model.model,
                                    child: Image.asset(
                                      model.imgAddress,
                                      width: size.width * 0.45,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              child: FadeAnimation(
                                delay: 2,
                                child: FittedBox(
                                  child: Text(
                                    "${model.name} ${model.model}",
                                    style: AppThemes.homeGridNameAndModel,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              child: FadeAnimation(
                                delay: 2.2,
                                child: Text(
                                  "\$${model.price.toStringAsFixed(2)}",
                                  style: AppThemes.homeGridPrice,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    ));
  }

  Padding _moreTextAndIcone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "More",
            style: AppThemes.homeMoreText,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.arrow_right),
            iconSize: 27,
          )
        ],
      ),
    );
  }

  Row _mainShoesListView(Size size) {
    return Row(
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            width: size.width / 16,
            height: size.height / 2.5,
            child: RotatedBox(
              quarterTurns: -1,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: featured.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndexOffeatured = index;
                      });
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: Text(
                        featured[index],
                        style: TextStyle(
                            fontSize:
                                selectedIndexOffeatured == index ? 21 : 18,
                            color: selectedIndexOffeatured == index
                                ? AppConstantsColor.darkTextColor
                                : AppConstantsColor.unSelectedTextColor,
                            fontWeight: selectedIndexOffeatured == index
                                ? FontWeight.w600
                                : FontWeight.w400),
                      ),
                    ),
                  );
                },
              ),
            )),
        SizedBox(
          height: size.height * 0.4,
          width: size.width * 0.915,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: availableShoes.length,
              itemBuilder: (context, index) {
                ShoeModel model = availableShoes[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.0005,
                        vertical: size.height * 0.01),
                    //height: size.height*0.6,
                    width: size.width / 1.5,
                    child: Stack(
                      children: [
                        Container(
                          width: size.width / 1.81,
                          decoration: BoxDecoration(
                              color: model.modelColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                        ),
                        Positioned(
                            left: 10,
                            child: FadeAnimation(
                              delay: 1,
                              child: Row(
                                children: [
                                  Text(model.name,
                                      style: AppThemes.homeProductName),
                                  SizedBox(
                                    width: size.width * 0.3,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            )),
                        Positioned(
                            top: 40,
                            left: 10,
                            child: FadeAnimation(
                              delay: 1.5,
                              child: Text(
                                model.model,
                                style: AppThemes.homeProductModel,
                              ),
                            )),
                        Positioned(
                            top: 80,
                            left: 10,
                            child: FadeAnimation(
                              delay: 2,
                              child: Text(
                                "\$${model.price.toStringAsFixed(2)}",
                                style: AppThemes.homeProductPrice,
                              ),
                            )),
                        Positioned(
                          top: 50,
                          right: 15,
                          child: FadeAnimation(
                            delay: 2,
                            child: Hero(
                              tag: model.imgAddress,
                              child: RotationTransition(
                                turns: const AlwaysStoppedAnimation(-30 / 360),
                                child: SizedBox(
                                  height: 230,
                                  width: 250,
                                  child: Image.asset(model.imgAddress),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 170,
                            bottom: 10,
                            child: IconButton(
                              icon: const FaIcon(
                                  FontAwesomeIcons.arrowCircleRight),
                              color: Colors.white,
                              iconSize: 25,
                              onPressed: () {},
                            ))
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  Row _categoryview(Size size) {
    return Row(
      children: [
        SizedBox(
          //color: Colors.red,
          width: size.width,
          height: size.height * 0.05,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndexOfCategory = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                        fontSize: selectedIndexOfCategory == index ? 21 : 18,
                        color: selectedIndexOfCategory == index
                            ? AppConstantsColor.darkTextColor
                            : AppConstantsColor.unSelectedTextColor,
                        fontWeight: selectedIndexOfCategory == index
                            ? FontWeight.w600
                            : FontWeight.w400),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
