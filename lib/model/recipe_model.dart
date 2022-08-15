class RecipeModel {
  String title, writer, description;
  int cookingTime;
  int servings;
  List<String> ingredients = [];
  String imgPath;

  RecipeModel({
    required this.title,
    required this.writer,
    required this.description,
    required this.cookingTime,
    required this.servings,
    required this.imgPath,
    required this.ingredients,
  });

  static List<RecipeModel> demoRecipe = [
    RecipeModel(
      title: 'Bubur Ayam Cirebon',
      writer: "abdullah",
      description: 'Sarapan favorite indonesia',
      cookingTime: 45,
      servings: 4,
      imgPath: 'images/buburayam.jpg',
      ingredients: [
        '1 1/2 cup beras',
        '1/2 ekor daging ayam kampung, potong sesuai selera',
        'Air secukupnya',
        '2 lembar daun salam',
      ],
    ),
    RecipeModel(
      title: 'Mie Goreng Jawa',
      writer: "Mualana Idris",
      description: 'Makanan buatan orang jawa',
      cookingTime: 20,
      servings: 10,
      imgPath: 'images/miegoreng.jpg',
      ingredients: [
        '- 1 bungkus mie telur',
        '- 1 ikat sawi hijau potong-potong',
        '- 2 butir telur kocok',
        '- 5 butir bakso iris tipis',
        '- 1 tangkai daun bawang rajang kasar',
        '- Secukupnya kecap manis',
        '- Secukupnya merica',
        '- 1 sdm saus tiram',
        '- 1 sdt kaldu bubuk',
        '- Garam Secukupnya',
      ],
    ),
    RecipeModel(
      title: 'Nasi Goreng Special',
      writer: "Mas Agus",
      description: 'makanan favorite indonesia',
      cookingTime: 15,
      servings: 6,
      imgPath: 'images/nasigoreng.jpg',
      ingredients: [
        '1 potong paha ayam atas bawah rebus, suwir ayamnya',
        '2 butir telur, kocok lepas',
        '150 gram udang tanpa kulit',
        '5 buah bakso sapi, potong-potong',
        '5 buah bakso ikan, potong-potong',
        '500 gram nasi putih',
        '2 sendok makan KECAP MANIS BANGO',
        '1 sendok teh garam',
        '1/2 sendok teh gula pasir',
        '1 batang daun bawang, diiris tipis',
        '1 1/2 sendok makan bawang goreng untuk taburan',
        '3 sendok makan minyak untuk menumis',
      ],
    ),
    RecipeModel(
      title: 'Soto Betawi',
      writer: "Pak sumarto",
      description:
          'Kuah soto Betawi memiliki tekstur yang kental dan rasa yang gurih karena menggunakan santan.',
      cookingTime: 40,
      servings: 38,
      imgPath: 'images/sotobetawi.jpeg',
      ingredients: [
        'Daging sapi - 500 gram',
        'Air (bisa dilebihkan bila kuah menyusut) - 2 liter',
        'Susu evaporasi - 250 ml',
        'Garam - 2,5 sdt',
        'Kaldu sapi bubuk - 1 sdt',
        'Gula pasir - 2 sdt',
        'Minyak - 3 sdm',
        'Minyak samin (optional) - 1 sdm',
      ],
    ),
  ];
}
