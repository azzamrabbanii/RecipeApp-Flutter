import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/model/Recipe_model.dart';
import 'package:recipe_app_flutter/screens/recipe_details.dart';

class NewRecipe extends StatelessWidget {
  const NewRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 28,
          ),
          ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: RecipeModel.demoRecipe.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetails(
                            recipeModel: RecipeModel.demoRecipe[index]),
                      ),
                    ),
                    child: RecipeCard(
                      RecipeModel.demoRecipe[index],
                    ),
                  ),
                );
              })
        ]),
      ),
    );
  }
}

class RecipeCard extends StatefulWidget {
  final RecipeModel recipeModel;

  RecipeCard(@required this.recipeModel);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool saved = false;
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Hero(
                tag: widget.recipeModel.imgPath,
                child: Image(
                  height: 320,
                  width: 320,
                  fit: BoxFit.cover,
                  image: AssetImage(widget.recipeModel.imgPath),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 40,
            child: InkWell(
                onTap: () {
                  setState(() {
                    saved = !saved;
                  });
                },
                child: Icon(
                  saved ? Icons.bookmark : Icons.bookmark_border_rounded,
                  color: Colors.white,
                  size: 30,
                )),
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recipeModel.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.recipeModel.writer,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.timer,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(widget.recipeModel.cookingTime.toString() + '\''),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          favorite = !favorite;
                        });
                      },
                      child: Icon(
                        favorite ? Icons.favorite : Icons.favorite_border_outlined,
                        color: favorite? Colors.red : Colors.black,
                      ),
                    )
                  ],
                ))
          ],
        ),
      )
    ]);
  }
}
