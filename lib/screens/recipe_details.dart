import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/model/Recipe_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class RecipeDetails extends StatelessWidget {
  final RecipeModel recipeModel;

  RecipeDetails({
    required this.recipeModel,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SlidingUpPanel(
        minHeight: (size.height / 2),
        maxHeight: (size.height / 1.2),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        backdropEnabled: true,
        parallaxEnabled: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: recipeModel.imgPath,
                  child: Image(
                    height: (size.height / 2) + 50,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(recipeModel.imgPath),
                  ),
                ),
              ),
              const Positioned(
                top: 40,
                right: 20,
                child: Icon(
                  Icons.bookmark_border_rounded,
                  color: Colors.white,
                  size: 38,
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              )
            ],
          ),
        ),
        panel: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                recipeModel.title,
                style: _textTheme.headline6,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                recipeModel.writer,
                style: _textTheme.caption,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("831"),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.timer,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(recipeModel.cookingTime.toString() + '\''),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(width: 2, height: 30, color: Colors.black),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    recipeModel.servings.toString() + ' Servings',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black.withOpacity(0.3),
              ),
              Expanded(
                  child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.black,
                      indicator: DotIndicator(
                          color: Colors.red,
                          distanceFromCenter: 16,
                          radius: 3,
                          paintingStyle: PaintingStyle.fill),
                      unselectedLabelColor: Colors.black.withOpacity(0.3),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                      // labelPadding: EdgeInsets.symmetric(
                      //   horizontal: 32
                      // ),
                      tabs: [
                        Tab(
                          text: "Ingredients".toUpperCase(),
                        ),
                        Tab(
                          text: "Preparation".toUpperCase(),
                        ),
                        Tab(
                          text: "Reviews".toUpperCase(),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            child: Text(recipeModel.ingredients.toString()),
                          ),
                          Container(
                            child: Text("Preparation"),
                          ),
                          Container(
                            child: Text("Reviews"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
