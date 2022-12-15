

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/users.dart';
import 'package:water/screens/breakfastbanner.dart';
import 'package:water/screens/dinnerbanner.dart';
import 'package:water/screens/fooddetails.dart';
import 'package:water/screens/lunchbanner.dart';
import 'package:water/screens/profilescreen.dart';
import 'package:water/screens/snackbanner.dart';
class HomeScreenPrac extends StatefulWidget {
   HomeScreenPrac();

  @override
  State<HomeScreenPrac> createState() => _HomeScreenPracState();
}
class _HomeScreenPracState extends State<HomeScreenPrac> {
  final users = FirebaseAuth.instance.currentUser!;
  int selectedIndex = 0;
  int currentIndex = 0;
  List categoryList = [ 
    {"image" : "assets/images/garlicshrimpspag.png", 
     "name" : "Dinner", },
     {"image" : "assets/images/pancake.png", 
     "name" : "Breakfast", },
     {"image" : "assets/images/cupcake.png", 
     "name" : "Snack", },
     {"image" : "assets/images/koreanbeefsoup.png", 
     "name" : "Lunch", }
  ];
  List dinnerList = [
    {"image" : "assets/images/pennechickencarbonara.png","name" : "Penne Chicken Carbonara", "time" : "40", "level" : "Easy", 
    "ingredients" : "12 oz. linguine \n4 slice bacon 12 oz. boneless, skinless chicken breasts \n1/4 tsp. salt \n1/4 tsp. pepper ,\n1 medium shallot \n2 clove garlic \n4 large eggs. \nfreshly grated Pecorino Romano cheese \n2 tbsp. Finely chopped fresh parsley",
    "procedure" : "Step 1 \nHeat large covered saucepot of salted water to boiling on high. Cook linguine as label directs. \nStep 2 \nMeanwhile, in 12-inch skillet, cook bacon on medium 6 to 9 minutes or until browned and crisp. Sprinkle chicken with 1/4 teaspoon salt. \nStep 3\nTransfer cooked bacon to paper towel. Add chicken to same skillet with drippings. Increase heat to medium-high. Cook chicken 2 minutes or until just starting to turn opaque, stirring occasionally. Add shallot. Cook 2 minutes, stirring. Add garlic. Cook 1 minute or until chicken is cooked through (165 degrees F), stirring. Remove from heat; cool slightly. Crumble bacon. \nStep 4\nIn large bowl, whisk together eggs, Pecorino, and 1/4 teaspoon freshly ground black pepper until well combined. Add bacon and cooled chicken mixture to eggs. \nStep 5\nWhen pasta is cooked, drain well. Add to large bowl with egg mixture, tossing to coat. Divide among 4 serving plates. Garnish with parsley, if desired."},

     {"image" : "assets/images/spaghetti.png","name" : "Spaghetti","time" : "60","level" : "Hard",
    "ingredients" : "3 tbsp. olive oil \n2 onions, finely chopped \n3 garlic cloves, crushed \n900 g (2lb) extra-lean beef mince \n2 level tbsp tomato purée \n300 ml (1⁄2 pint) red wine \n2 x 400 g cans chopped tomatoes \n2 bay leaves \n250 g (9oz) mushrooms, sliced \n2 tsp. Worcestershire sauce \n900 g (2lb) dried spaghetti \n100 g (31/2oz) Parmesan cheese, grated",
    "procedure" : "Step 1 \nHeat half the oil in a large pan and fry the onion for 4-5min until golden. Add the garlic and cook for a further 1min. \nStep 2 \nAdd the mince and stir-fry for 5-6min until browned all over. Stir in the tomato purée and the red wine, then cover and bring to the boil. Add the tomatoes, bay leaves, mushrooms and Worcestershire sauce, season well and simmer for 40min. \nStep 3\nMeanwhile, cook the spaghetti in boiling, salted water according to packet instructions. Drain, then return to the pan. Add the remaining oil, season and toss together. \nStep 4\nCheck the seasoning in the bolognese sauce, and add to the pasta, toss well and grate over the Parmesan."},

     {"image" : "assets/images/koreanbeefsoup.png", "name" : "Korean Beef Soup", "time" : "30", "level" : "Medium" ,
    "ingredients" : "1 pound brisket \n4 quarts water \n2 bunches scallions, cut into 2-inch pieces \n1 cup bean sprouts \n13/4 cup dried fernbrake, gosari, or bracken fiddleheads, presoaked in boiling water \n2tablespoons minced garlic \n2tablespoons sesame oil \n1 to 2 teaspoons gochugaru, red pepper powder \n1 to 2 tablespoons gochujang, red pepper paste \n2 teaspoons soy sauce, more to taste \n1/2 to 1 teaspoon freshly ground black pepper \n2 large eggs, beaten \n1 cup cooked glass noodles, optional",
    "procedure" : "Gather the ingredients. \nIn a large pot, bring the brisket and the water to a boil. \nReduce heat to medium-low, partially cover the pot, and simmer until the meat is tender, skimming off the fat and foam. \nRemove the meat from the broth but keep the broth in the pot.\nWhen it's cool enough to handle, hand-shred the beef with the grain (discard any gristle). \nIn a large bowl, combine shredded beef with scallions, bean sprouts, and fernbrake. \nAdd the garlic, sesame oil, gochugaru, gochujang, soy sauce, and black pepper to the beef and toss to combine. \nAdd noodles, if using, and remove from the heat. Divide between bowls and serve. " },

     {"image" : "assets/images/salmon.png", "name" : "Salmon with Lentil Salad","time" : "15","level" : "Easy",
    "ingredients" : "2 tbsp. olive oil, divided \n1/4 lb. skinless salmon fillet \nKosher salt and pepper \n2 tbsp. red wine vinegar \n15-ounce can lentils, rinsed \n1 small English cucumber, cut into pieces \n1 pink grapefruit, peel and pith removed, cut into pieces \n4 small radishes, thinly sliced \n6 c. arugula",
    "procedure" : "Step 1 \nPress Sauté on multicooker and heat 1 tablespoon oil. Add onion and pepper, season with 1/4 teaspoon each salt and pepper, and sauté until just tender, 5 minutes; transfer to bowl. \nStep 2 \nAdd remaining tablespoon oil, season beef with 1/4 teaspoon each salt and pepper, and cook until browned on all sides, about 5 minutes. \nStep 3 \nWhisk together coconut milk and curry paste, add to pot, and scrape up any brown bits. Cover and lock lid and cook on high pressure for 35 minutes. Use natural release method for 10 minutes, then release any remaining pressure. \nStep 4 \nUsing 2 forks, break up meat into pieces, then toss with onion and red pepper. Serve over rice along with lime wedges and topped with cilantro and red chile if desired." },

     {"image" : "assets/images/mole.png", "name" : "Chicken Mole", "time" : "20", "level" : "Medium", 
    "ingredients" : "1 tbsp. olive oil \n1large onion, chopped \n3 cloves garlic, finely chopped \n2 tsp. chili powder \n1 c. prepared salsa \n1 c. chicken broth \n1/2 c. Homemade Nutella",
    "procedure" : "Step 1 \nHeat oil in a Dutch oven on medium. Add onion, garlic and chili powder and cook until softened, stirring often, about 7 minutes. \nStep 2 \nStir in salsa and chicken broth, then whisk in Homemade Nutella. \nStep 3 \nSeason chicken with 1/2 teaspoon salt and add to the pot. Simmer until chicken is tender and cooked through, about 30 minutes. Serve with yellow rice, sprinkled with sesame seeds and scallions if desired."},

     {"image" : "assets/images/thaibeef.png",  "name" : "Thai Beef and Veggie Stir-Fry", "time" : "25", "level" : "Medium",
    "ingredients" : "1 lb. beef sirloin \n8 oz. green beans \n1/4 c. Thai green curry paste \n1 13.5-ounce can unsweetened light coconut milk \n1 8-ounce can bamboo shoots",
    "procedure" : "Step 1\n1 Thinly slice the beef and season with 1/4 teaspoon kosher salt. \nStep 2 \n1Heat a large skillet on medium-high. Add 1 tablespoon olive oil to skillet and swirl; then add the beef and cook until browned, 2 to 3 minutes per side, and transfer to a plate. \nStep 3 \nWhile the beef is browning, cut the green beans in half. Set aside. \nStep 4 \nAdd the Thai green curry paste and cook while stirring for 2 minutes. Whisk in the unsweetened light coconut milk and bring everything to a simmer. \nStep 5 \nAdd the green beans and cook just until they're tender, about 3 to 5 minutes. Meanwhile, drain the can of bamboo shoots. \nStep 6 \nReturn the beef to the skillet along with the bamboo shoots and heat through. Serve over cooked rice and sprinkle with fresh basil." },
    
  ];
  List breakfastList = [
    {"image" : "assets/images/scrambbleegg.png", "name" : "Trout Scrambled Eggs", "time" : "10",  "level" : "Easy",
    "ingredients" : "1 tbsp. unsalted butter or olive oil \n8 large eggs \nKosher salt and pepper",
    "procedure" : "Step 1 \nHeat butter (or oil) in a 10 to 12-in non-stick skillet on medium-low. \nStep 2 \nIn a bowl, whisk together, eggs and ½ tsp each salt and pepper. \nStep 3\nAdd eggs to skillet and cook, stirring often until eggs are beginning to set. \nStep 4\nOnce the eggs are nearly set, add desired toppings (think cheese, cooked veggies, herbs, tender greens like spinach or baby kale)."},
     {"image" : "assets/images/bruschetta.png", "name" : "Nectarine Bruschetta","time" : "15", "level" : "Medium", 
     "ingredients" : "4 tbsp. white wine vinegar \n4 tsp. honey \n2 nectarines, sliced \n1/2 c. extra virgin olive oil \n1 tbsp. very coarsely cracked black pepper \n3/4 c. ricotta cheese \n4 large thick slices country bread",
    "procedure" : "Step 1 \nIn a bowl, whisk together vinegar and honey to dissolve. Add nectarine slices and toss to coat; let marinate 10 minutes. Add olive oil and black pepper and toss to coat. \nStep 2 \nGrill or toast bread and spread with ricotta cheese, then spoon nectarines and juices on top."},
     {"image" : "assets/images/tropical.png", "name" : "Tropical Smoothie Bowl","time" : "5", "level" : "Easy",
      "ingredients" : "1 banana, sliced and frozen \n1 c. frozen mango chunks \n1 c. frozen pineapple chunks \n1 c. almond milk",
    "procedure" : "Step 1 \nIn blender, pulse banana, mango, and pineapple with almond milk until smooth but still thick, stopping and stirring occasionally. Add more liquid if needed. Pout into 2 bowls. Top as desired."},
     {"image" : "assets/images/gruyere.png",  "name" : "Gruyère, Bacon, and Spinach Scrambled Eggs", "time" : "20","level" : "Medium", 
     "ingredients" : "8 large eggs \n1 tsp. Dijon mustard \nKosher salt and pepper \n1 tbsp. olive oil or unsalted butter \n2 slices thick-cut bacon, cooked and broken into pieces \n2 c. spinach, torn \n2 oz. Gruyère cheese, shredded",
    "procedure" : "Step 1 \nIn a large bowl, whisk together eggs, Dijon mustard, 1 tablespoon water and 1/2 teaspoon each salt and pepper. \nStep 2 \nHeat oil or butter in 10-inch nonstick skillet on medium. Add eggs and cook, stirring with rubber spatula every few seconds, to desired doneness, 2 to 3 minutes for medium-soft eggs. Fold in bacon, spinach, and Gruyère cheese."},
      {"image" : "assets/images/roastedp.png",   "name" : "Roasted Potato and Chorizo Hash", "time" : "45", "level" : "Hard", 
      "ingredients" : "1 medium red onion, cut into 1/4-inch-thick wedges \n1 large sweet potato (about 12 oz.), peeled and cut into 3/4-inch chunks \n1 yellow potato (about 8 oz.), cut into 3/4-inch chunks \n1 poblano pepper, cut into thin 1-inch pieces \n4 large cloves garlic, smashed \n2 tbsp. olive oil  \nKosher salt and pepper \n6 oz. fresh chorizo, casings removed \n4 large eggs \n2 oz. extra-sharp Cheddar, coarsely grated \nWarm tortillas, for serving",
    "procedure" : "Step 1 \nHeat oven to 425°F. On large rimmed baking sheet, toss onion, potatoes, poblano, and garlic with oil and 1/4 teaspoon each salt and pepper. Arrange in even layer and roast until golden brown and tender, 25 to 30 minutes. \nStep 2 \nWhile vegetables roast, heat large nonstick skillet on medium. Add chorizo and cook, breaking up into tiny pieces, until browned and crisp around edges, 5 to 6 minutes; transfer to bowl. Add eggs to skillet and cook to desired doneness, 3 to 4 minutes for slightly runny yolks. Toss chorizo with vegetables, then scatter with Cheddar. Return to oven to melt if needed. Serve with eggs and tortillas if desired."},
     {"image" : "assets/images/oatmeal.png",  "name" : "Instant Oatmeal With Cranberries and Pecans","time" : "5","level" : "Easy", 
     "ingredients" : "1/4 c. quick oats \n1 tbsp. dried cranberries \n1 tbsp. chopped toasted pecans \n1/2 tsp. brown sugar \nGround cinnamon \nGrated orange zest \nKosher salt",
    "procedure" : "Step 1 \nIn bowl, place quick oats, dried cranberries and chopped toasted pecans, brown sugar and pinch each of ground cinnamon, grated orange zest and salt. \nStep 2 \nAdd 1/2 to 3/4 cup just-boiling water. Let sit 1 min. Stir and eat."},
  ];
  List snackList = [
    {"image" : "assets/images/cinnamon.png",  "name" : "Cinnamon-Apple Cake With Oat Streusel", "time" : "60", "level" : "Hard",
    "ingredients" : "1 c. all-purpose flour \n1 tsp. ground cinnamon \n1/2 tsp. baking soda  \n1/4 tsp. kosher salt \n1/2 stick unsalted margarine, room temperature \n1/2 c. packed light brown sugar \n1 large egg, room temperature \n1 tsp. pure vanilla extract \n1/2 c. sour cream",
    "procedure" : "Step 1\nHeat oven to 350°F. \nStep 2 \nMake the crumble topping: In a medium bowl, combine the oats, flour, sugar, cinnamon and salt. Add the margarine and using your fingertips, squeeze the margarine into the dry mixture until everything is combined and crumbly; it should take about 3 minutes. Set aside. \nStep 3 \nMake the apple cake: Lightly coat a 9-inch round baking pan with non-stick cooking spray, line bottom with parchment, and spray parchment."},
     {"image" : "assets/images/Pimiento.png",  "name" : "Pimiento Cheese Make-Ahead Quiche", "time" : "50","level" : "Medium", 
     "ingredients" : "1 1/4 c. all-purpose flour \n1/2 tsp. sugar \n1/2 tsp. salt \n6 tbsp. cold vegetable shortening \n3 tbsp. water \n4 large eggs \n1 1/4 c. whole milk \n1/2 tsp. salt",
    "procedure" : "Step 1 \nWhisk together eggs, milk, and 1/2 teaspoon salt. \nStep 2 \nStir Cheddar cheese, chopped pimientos, green onions, hot pepper sauce, and Worcestershire sauce into custard. \nStep 3 \nBake in 375 degrees F oven 35 to 45 minutes or until center is just set. Cool 15 minutes. Serve warm or at room temperature."},
     {"image" : "assets/images/Burritos.png", "name" : "Smoky Shredded Beef Burritos","time" : "45","level" : "Easy", 
     "ingredients" : "1 15-oz can tomato sauce \n1 tbsp. chopped chipotle chile in adobo plus 1 Tbsp sauce \n1/2 tsp. ground cumin \nKosher salt \n2 cloves garlic, chopped \n1 onion, thinly sliced \n1 lb. flank steak, cut crosswise into 2-in.-thick strips \n1 15-oz can black beans, rinsed \n4 large tortillas, warmed \n1 c. shredded extra-sharp Cheddar",
    "procedure" : "STEP 1 \nIn a 5- to 6-quart slow-cooker bowl, whisk together tomato sauce, chipotles and adobo, cumin, and 1/2 teaspoon salt; stir in garlic and onion.  \nSTEP 2 \nNestle beef into onion-spice mixture and cook, covered, until it shreds easily, 4 to 5 hours on high or 7 to 8 hours on low.  \nSTEP 3 \nSpoon off and discard any fat in slow cooker. Transfer beef to a bowl; add beans to the slow cooker and turn to high; cook until heated through, 3 minutes. Using two forks, shred beef, then toss with beans.  \nSTEP 4 \nFill tortillas with beef mixture, cheese, lettuce, cilantro, and pico de gallo; roll up. Serve with more sour cream, jalapeño, and lime wedges, if desired."},
     {"image" : "assets/images/Sweet.png", "name" : "Sweet Potato Croquettes", "time" : "50","level" : "Medium", 
     "ingredients" : "2 medium sweet potatoes, peeled and cut into 1-inch chunks \n2 tbsp. melted butter \n4 medium leaves sage, finely chopped \n3 c. panko (Japanese bread crumbs), divided \n1 large egg \n1 qt. canola or vegetable oil \nFinely grated parmesan and lemon peel, for serving",
    "procedure" : "Step 1 \nIn large saucepot of salted water, heat sweet potatoes to boiling on high. Reduce heat to maintain simmer; cook 10 minutes or until tender. Drain well; return to pot. With potato masher, mash sweet potatoes, with butter, sage, 1 cup panko and 1/2 teaspoon each salt and pepper. Cool slightly; mash in egg. Refrigerate, uncovered, until cold and stiff, at least 5 hours. \nStep 2 \nLine large cookie sheet with parchment or waxed paper. By 2-tablespoon portions, scoop sweet potato mixture; shape into ovals and roll in remaining 2 cups panko, pressing to adhere. Arrange on lined cookie sheet. Freeze until stiff or up to 5 days."},
      {"image" : "assets/images/Guacamole.png", "name" : "Chunky Guacamole", "time" : "10", "level" : "Easy" ,
      "ingredients" : "3 ripe avocados, diced \n1/4 small white onion, finely chopped \n1/4 c. cilantro, chopped \n1 jalapeño, seeded and finely chopped \n2 tbsp. fresh lime juice \n1 tsp. Kosher salt",
    "procedure" : "Step 1 \nIn medium bowl, gently combine all ingredients with 1 teaspoon salt."},
     {"image" : "assets/images/Salsa.png", "name" : "Charred Salsa",  "time" : "20", "level" : "Easy", 
     "ingredients" : "1 lb. tomatoes, halved if large \n1 small onion (skin on), halved \n1 small garlic clove, skin on \n1 jalapeño \n1/4 c. cilantro \nKosher salt",
    "procedure" : "1. Heat grill to medium-high. Grill tomatoes, onion, garlic, and jalapeño, turning occasionally, until charred on all sides, about 10 minutes total. Let cool 10 minutes. \n2. Remove skins from onion and garlic and transfer all vegetables to blender. Add cilantro and 1/2 teaspoon salt and puree until mostly smooth."},
  ];
  List lunchList = [
    {"image" : "assets/images/potbeef.png",    "name" : "Instant Pot Beef Curry", "time" : "45", "level" : "Medium", 
    "ingredients" : "2 tbsp. canola oil, divided \n1 red onion, sliced 1/4 inch thick \n1 large red pepper, quartered lengthwise, then sliced crosswise \nKosher salt and pepper \n1 2-lb beef chuck roast, well trimmed and cut into 3-inch pieces \n1 14.5-oz can coconut milk, well shaken \n3 tbsp. Thai red curry paste \nCooked rice, lime wedges, cilantro, and sliced red chile, for serving",
    "procedure" : "Step 1 \nPress Sauté on multicooker and heat 1 tablespoon oil. Add onion and pepper, season with 1/4 teaspoon each salt and pepper, and sauté until just tender, 5 minutes; transfer to bowl. \nStep 2 \nAdd remaining tablespoon oil, season beef with 1/4 teaspoon each salt and pepper, and cook until browned on all sides, about 5 minutes. \nStep 3 \nWhisk together coconut milk and curry paste, add to pot, and scrape up any brown bits. Cover and lock lid and cook on high pressure for 35 minutes. Use natural release method for 10 minutes, then release any remaining pressure."},
    {"image" : "assets/images/BarleyStew.png",  "name" : "Instant Pot Beef and Barley Stew", "time" : "55",   "level" : "Easy",
    "ingredients" : "1 lb. beef chuck, well trimmed, cut into 2-inch pieces \n1 tbsp. all-purpose flour \n1 tbsp. olive oil \n1 large onion, chopped \n4 cloves garlic, smashed \n8 sprigs thyme, plus leaves for serving \nKosher salt and pepper",
    "procedure" : "Step 1 \nSet Instant Pot to Sauté. In a medium bowl, toss beef with flour. Add olive oil to Instant Pot, then cook beef until browned on all sides, 5 to 6 minutes. Transfer beef to a plate. \nStep 2 \nAdd onion, garlic, thyme sprigs, and 1/2 teaspoon each salt and pepper and cook, stirring occasionally, until tender, 5 to 6 minutes. Stir in beer. Press Cancel. \nStep 3 \nReturn beef to pot along with squash, carrots, beef stock, and barley. Lock the lid and cook on high pressure 16 minutes. Use quick-release method to release pressure. Serve sprinkled with additional thyme if desired." },
    {"image" : "assets/images/Lime.png",  "name" : "Honey-Lime Pork with Pineapple Slaw",  "time" : "40",  "level" : "Medium",
    "ingredients" : "1/4 c. low-sodium soy sauce \n1 tbsp. Worcestershire sauce \n1/4 c. plus 1 tablespoon honey \n3 tbsp. fresh lime juice \n1 large clove garlic, finely chopped \n1 1/2 lb. boneless pork butt or shoulder, trimmed and cut into 1 1/2-inch pieces \nKosher salt \nPepper",
    "procedure" : "STEP 1 \nIn a 6-quart slow cooker, whisk together soy sauce, Worcestershire, 1/4 cup honey, and 1 tablespoon lime juice; stir in garlic. Season pork with 1/4 teaspoon salt and 1/2 teaspoon pepper. Add to slow cooker and toss to coat. Cook, covered, until pork is tender and easily pulls apart with a fork, 6 to 7 hours on low or 4 to 5 hours on high. \nSTEP 2 \nFifteen minutes before serving, in a large bowl, whisk together yogurt, cider vinegar, remaining 2 tablespon lime juice and 1 tablespoon honey, and pinch each salt and pepper. Add scallions, cabbage, and pineapple and toss. Fold in cilantro just before serving. Transfer pork to a bowl and, using two forks, break into smaller pieces. Serve over rice with pineapple slaw." },
    {"image" : "assets/images/Onion.png",  "name" : "French Onion Soup", "time" : "35",  "level" : "Medium",
    "ingredients" : "3 tbsp. olive oil  \n4 pounds yellow onions (about 5 large onions), thinly sliced \nKosher salt \n1 1/2 tsp. all-purpose flour \n1/4 c. cognac or dry white wine \n2 32-oz containers low-sodium beef broth  \n2 bay leaves \n6 large sprigs thyme, plus more for sprinkling",
    "procedure" : "Step 1 \nHeat oil in large, heavy stockpot on medium. Add onions and 11/2 teaspoons salt, reduce heat to low and cook, stirring occasionally, until onions are tender and have released their liquid, 10 minutes.  \nStep 2 \nIncrease heat to medium-high and continue cooking, stirring often and scraping bottom of pot, until onions are deep brown and caramelized, 40 to 50 minutes. If bottom of pot starts to get too dark, add 4 to 5 tablespoons water.  \nStep 3 \nSprinkle onions with flour and cook, stirring, 2 minutes. Stir in cognac and cook 1 minute. Add broth and herbs and simmer until reduced to about 8 cups, 18 to 20 minutes. Discard herbs and stir in vinegar." },
    {"image" : "assets/images/Chowder.png",  "name" : "Manhattan Clam Chowder",  "time" : "30",  "level" : "Medium",
    "ingredients" : "2 tbsp. olive oil \n2 stalks celery, thinly sliced \n1 large onion, finely chopped \n1 large carrot, cut into 1/4-inch pieces \n2 cloves garlic, finely chopped \n1/2 tsp. red pepper flakes \n1 lb. russet potatoes, cut into 1/2-inch pieces \n3 sprigs thyme \n2 8-ounce bottles clam juice",
    "procedure" : "Step 1 \nIn blender, pulse banana, mango, and pineapple with almond milk until smooth but still thick, stopping and stirring occasionally. Add more liquid if needed. Pout into 2 bowls. Top as desired." },
    {"image" : "assets/images/Tex.png",  "name" : "Slow-Cooker Tex-Mex Chicken Soup",  "time" : "25",  "level" : "Easy",
    "ingredients" : "2 1/2 lb. bone-in, skin-on chicken thighs, skin removed\n4 c. lower-sodium chicken broth \n3 large stalks celery, sliced \n3 medium carrots, sliced \n2 poblano peppers, seeded and chopped \n1 medium onion, chopped \n3 cloves garlic, chopped \n1 tbsp. ground cumin \n1 tbsp. ground coriander \n2 15 oz. cans white (cannellini) beans, drained",
    "procedure" : "Step 1 \nTo 6- to 7-quart slow-cooker bowl, add chicken, broth, celery, carrots, peppers, onion, garlic, cumin, coriander, beans and 1/2 teaspoon salt. Cover and cook on Low 4 to 5 hours or until carrots are tender. \nStep 2 \nRemove and discard bones from chicken; shred chicken and return to slow-cooker bowl. \nStep 3 \nAdd cheese, lime juice and 1/4 teaspoon salt to soup in bowl, stirring until cheese melts. Serve topped with avocado, cilantro, sour cream and Baked Tortilla Strips, if desired. \nStep 4 \nBaked Tortilla Strips: Preheat oven to 425 degrees F. Stack 4 small corn tortillas; thinly slice into 1/8-wide strips. Arrange in single layer on large baking sheet. Spray all over with nonstick cooking spray. Bake 4 to 5 minutes or until deep golden brown. Let cool completely." },
    
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: cPrimaryColor,
     
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            currentIndex == 0? Padding(
              padding: const EdgeInsets.only(
                  top: 55.0, bottom: 32.0, left: 32.0, right: 32.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     read(users.uid),
                  ]),
            ): Center(),
            currentIndex == 1? Padding(
              padding: const EdgeInsets.only(
                  top: 55.0, bottom: 32.0, left: 32.0, right: 32.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    read(users.uid),
                  ]),
            ): Center(),
            currentIndex == 2? Padding(
              padding: const EdgeInsets.only(
                  top: 55.0, bottom: 32.0, left: 32.0, right: 32.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    read(users.uid),
                    
                  ]),
            ): Center(),
            currentIndex == 3? Padding(
              padding: const EdgeInsets.only(
                  top: 55.0, bottom: 32.0, left: 32.0, right: 32.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    read(users.uid),
                   
                  ]),
            ): Center(),
            
              
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                    decoration: BoxDecoration(
                     
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: currentIndex == 0? GestureDetector(
                      onTap: () {
                         Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DinnerBanner(),
                                ),
                              );
                      },
                      child: Stack(
                        
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(35.0),
                            child: Image.asset(
                              'assets/images/food-wallpaper.jpg',
                              height: 200,
                              width: 450,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(230, 30, 15, 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Menu for dinner',
                                  style: TextStyle(
                                    color: cLightFontColor,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                            
                                Text(
                                  'Baked Chicken',
                                  style: TextStyle(
                                      color: cColor5,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(0.0),
                                        margin: EdgeInsets.only(right: 6.0),
                                        decoration: BoxDecoration(
                                          color: cColor5,
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Icon(Icons.timer_outlined, size: 23, )),
                                    Text(
                                      '60 mins',
                                      style: TextStyle(
                                          color: cColor5,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(0.0),
                                        margin: EdgeInsets.only(right: 6.0),
                                        decoration: BoxDecoration(
                                          color: cColor5,
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Icon(Icons.local_fire_department_outlined, size: 23, )),
                                    Text(
                                      'Hard Level',
                                      style: TextStyle(
                                          color: cColor5,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ) : Center(),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                    decoration: BoxDecoration(
                     
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: currentIndex == 1? GestureDetector(
                      onTap: () {
                         Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BreakfastBanner(),
                                ),
                              );
                      },
                      child: Stack(
                        
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(35.0),
                            child: Image.asset(
                              'assets/images/eggsandwhichcover.jpg',
                              height: 200,
                              width: 450,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(230, 30, 15, 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Menu for Breakfast',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                            
                                Text(
                                  'Egg Sandwiches',
                                  style: TextStyle(
                                      color: Colors.green[900],
                                      fontSize: 23,
                                      fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(0.0),
                                        margin: EdgeInsets.only(right: 6.0),
                                        decoration: BoxDecoration(
                                          color: Colors.green[900],
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Icon(Icons.timer_outlined, size: 23, color: Colors.white, )),
                                    Text(
                                      '20 mins',
                                      style: TextStyle(
                                          color: Colors.green[900],
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(0.0),
                                        margin: EdgeInsets.only(right: 6.0),
                                        decoration: BoxDecoration(
                                          color: Colors.green[900],
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Icon(Icons.local_fire_department_outlined, size: 23,color: Colors.white )),
                                    Text(
                                      'Medium Level',
                                      style: TextStyle(
                                          color: Colors.green[900],
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ) : Center(),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                    decoration: BoxDecoration(
                     
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: currentIndex == 2? GestureDetector(
                      onTap: () {
                         Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SnackBanner(),
                                ),
                              );
                      },
                      child: Stack(
                        
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(35.0),
                            child: Image.asset(
                              'assets/images/cheeseballs.jpg',
                              height: 200,
                              width: 450,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(230, 30, 15, 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Menu for Snacks',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                            
                                Text(
                                  'Trio Cheese Balls',
                                  style: TextStyle(
                                      color: cPrimaryColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(0.0),
                                        margin: EdgeInsets.only(right: 6.0),
                                        decoration: BoxDecoration(
                                          color: cAccentColor,
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Icon(Icons.timer_outlined, size: 23, color: Colors.white, )),
                                    Text(
                                      '25 mins',
                                      style: TextStyle(
                                          color: cPrimaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(0.0),
                                        margin: EdgeInsets.only(right: 6.0),
                                        decoration: BoxDecoration(
                                          color: cAccentColor,
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Icon(Icons.local_fire_department_outlined, size: 23,color: Colors.white )),
                                    Text(
                                      'Easy Level',
                                      style: TextStyle(
                                          color: cPrimaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ) : Center(),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                    decoration: BoxDecoration(
                     
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: currentIndex == 3? GestureDetector(
                      onTap: () {
                         Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LunchBanner(),
                                ),
                              );
                      },
                      child: Stack(
                        
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(35.0),
                            child: Image.asset(
                              'assets/images/shak.JPG',
                              height: 200,
                              width: 450,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(230, 30, 15, 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Menu for Lunch',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                            
                                Text(
                                  'Shakshuka',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(0.0),
                                        margin: EdgeInsets.only(right: 6.0),
                                        decoration: BoxDecoration(
                                          color: Colors.green[900],
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Icon(Icons.timer_outlined, size: 23, color: Colors.white, )),
                                    Text(
                                      '45 mins',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(0.0),
                                        margin: EdgeInsets.only(right: 6.0),
                                        decoration: BoxDecoration(
                                          color: Colors.green[900],
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Icon(Icons.local_fire_department_outlined, size: 23,color: Colors.white )),
                                    Text(
                                      'Medium Level',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ) : Center(),
                  ),
                  
                ],
              ),
            
            
            Padding(
              padding: EdgeInsets.only(top: 25.0, right: 32.0, left: 32.0, ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Meal Category',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                  color: cAccentColor
                )),  
              ],),
            ),

            Column(
              children: [
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: 
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0 ),
                      child: Row(
                        children: 
                      List.generate(categoryList.length, (index) => 
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: GestureDetector(
                          onTap: () => 
                          setState(() {
                            currentIndex = index;
                          }),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0,),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                              decoration: BoxDecoration( color: currentIndex == index? cLightGreyColor: Colors.purple.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(18.0),
                              border: Border.all( width: 1.0, color: currentIndex == index? cLightbackColor : cLightGreyColor )),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 16.0),
                                     padding: EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      color: currentIndex == index? Colors.transparent :Colors.transparent,
                                      borderRadius:  BorderRadius.circular(8.0)
                                    ),
                                    child: Image.asset(categoryList[index]["image"],
                                    height: 36.0,
                                    width: 36.0, 
                                    fit: BoxFit.contain,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Text(categoryList[index]["name"],
                                    style: TextStyle(fontSize:20.0,
                                    fontWeight: FontWeight.w800,
                                    color: currentIndex == index? cLightbackColor : cColor6 ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),),
                      ),
                    ),
                  ),
                ),
                   
              currentIndex ==0?  Padding(
                padding: const EdgeInsets.only(left: 16.0, right:16.0, bottom:16.0 ),
                child: GridView.builder( 
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 60.0,
                    crossAxisSpacing: 0.0
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 44.0),
                  itemCount: dinnerList.length,
                  itemBuilder:(context, index) { 
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FoodDetails(
                          index,
                          dinnerList[index]["image"],
                          dinnerList[index]["name"],
                          dinnerList[index]["time"],
                          dinnerList[index]["level"],
                          dinnerList[index]["ingredients"],
                          dinnerList[index]["procedure"]
                        ),
                        ),
                        ),
                      child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 200.0,
                          width: 170.0,
                          padding: EdgeInsets.only(bottom: 24.0),
                          decoration: BoxDecoration(
                            color: cLightGreyColor,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Text(dinnerList[index]['name'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: cLightFontColor,
                                ),),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: 
                                  List.generate(5, (index) => 
                                  Icon(Icons.star, color: Colors.yellow, size: 16.0,),
                                  )
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${dinnerList[index]["time"]} \nMin ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: cLightFontColor,
                                    fontWeight: FontWeight.w400
                                  ),),
                                  Column(
                                    children: List.generate(6, (index) => Container(
                                      height: 2.0,
                                      width:2.0,
                                      margin: EdgeInsets.only(bottom:2),
                                      decoration: BoxDecoration(
                                         color: cDarkGreyFontColor,
                                         borderRadius: BorderRadius.circular(2.0)
                                    
                                      ),
                                     
                                    )),
                                    
                                  ),
                                  Text(
                                    "${dinnerList[index]["level"]} \nLevel ",
                                   textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: cLightFontColor,
                                    fontWeight: FontWeight.w400
                                  ),),
                                ],
                              )  
                            ],
                          ),
                        ),
                        Positioned(
                          top: -170.0,
                          bottom: 0.0,
                          left: 1.0,
                          right: 0.0,
                          child: Container(
                            child: Hero(
                              tag: "tag$index",
                              child: Image.asset(dinnerList[index]['image'],
                              height: 10,

                              
                              ),
                            ),
                          ),
                        )
                      ],              ),
                    ); },
                ),
              ) : Center(),

              currentIndex ==1?  Padding(
                padding: const EdgeInsets.only(left: 16.0, right:16.0, bottom:16.0 ),
                child: GridView.builder( 
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 60.0,
                    crossAxisSpacing: 0.0
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 44.0),
                  itemCount: breakfastList.length,
                  itemBuilder:(context, index) { 
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FoodDetails(
                          index,
                          breakfastList[index]["image"],
                          breakfastList[index]["name"],
                          breakfastList[index]["time"],
                          breakfastList[index]["level"],
                          breakfastList[index]["ingredients"],
                          breakfastList[index]["procedure"]
                        ),
                        ),
                        ),
                      child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 200.0,
                          width: 170.0,
                          padding: EdgeInsets.only(bottom: 24.0),
                          decoration: BoxDecoration(
                            color: cLightGreyColor,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Text(breakfastList[index]['name'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                textAlign: TextAlign.center,
                                
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: cLightFontColor,
                                ),),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: 
                                  List.generate(5, (index) => 
                                  Icon(Icons.star, color: Colors.yellow, size: 16.0,),
                                  )
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${breakfastList[index]["time"]} \nMin ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: cLightFontColor,
                                    fontWeight: FontWeight.w400
                                  ),),
                                  Column(
                                    children: List.generate(6, (index) => Container(
                                      height: 2.0,
                                      width:2.0,
                                      margin: EdgeInsets.only(bottom:2),
                                      decoration: BoxDecoration(
                                         color: cDarkGreyFontColor,
                                         borderRadius: BorderRadius.circular(2.0)
                                    
                                      ),
                                     
                                    )),
                                    
                                  ),
                                  Text(
                                    "${breakfastList[index]["level"]} \nLevel ",
                                   textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: cLightFontColor,
                                    fontWeight: FontWeight.w400
                                  ),),
                                ],
                              )  
                            ],
                          ),
                        ),
                        Positioned(
                          top: -170.0,
                          bottom: 0.0,
                          left: 2.0,
                          right: 0.0,
                          child: Container(
                            child: Hero(
                              tag: "tag$index",
                              child: Image.asset(breakfastList[index]['image'],
                               height: 10,
                             

                             
                              
                              ),
                            ),
                          ),
                        )
                      ],              ),
                    ); },
                ),
              ) : Center(),
              currentIndex ==2?  Padding(
                padding: const EdgeInsets.only(left: 16.0, right:16.0, bottom:16.0 ),
                child: GridView.builder( 
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 60.0,
                    crossAxisSpacing: 0.0
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 44.0),
                  itemCount: snackList.length,
                  itemBuilder:(context, index) { 
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FoodDetails(
                          index,
                          snackList[index]["image"],
                          snackList[index]["name"],
                          snackList[index]["time"],
                          snackList[index]["level"],
                          snackList[index]["ingredients"],
                          snackList[index]["procedure"]
                          
                        ),
                        ),
                        ),
                      child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 200.0,
                          width: 170.0,
                          padding: EdgeInsets.only(bottom: 24.0),
                          decoration: BoxDecoration(
                            color: cLightGreyColor,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Text(snackList[index]['name'],
                                 overflow: TextOverflow.ellipsis,
                                 maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: cLightFontColor,
                                ),),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: 
                                  List.generate(5, (index) => 
                                  Icon(Icons.star, color: Colors.yellow, size: 16.0,),
                                  )
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${snackList[index]["time"]} \nMin ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: cLightFontColor,
                                    fontWeight: FontWeight.w400
                                  ),),
                                  Column(
                                    children: List.generate(6, (index) => Container(
                                      height: 2.0,
                                      width:2.0,
                                      margin: EdgeInsets.only(bottom:2),
                                      decoration: BoxDecoration(
                                         color: cDarkGreyFontColor,
                                         borderRadius: BorderRadius.circular(2.0)
                                    
                                      ),
                                     
                                    )),
                                    
                                  ),
                                  Text(
                                    "${snackList[index]["level"]} \nLevel ",
                                   textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: cLightFontColor,
                                    fontWeight: FontWeight.w400
                                  ),),
                                ],
                              )  
                            ],
                          ),
                        ),
                        Positioned(
                          top: -170.0,
                          bottom: 0.0,
                          left: 1.0,
                          right: 0.0,
                          child: Container(
                            child: Hero(
                              tag: "tag$index",
                              child: Image.asset(snackList[index]['image'],
                              height: 10,

                              
                              ),
                            ),
                          ),
                        )
                      ],              ),
                    ); },
                ),
              ) : Center(),
              currentIndex ==3?  Padding(
                padding: const EdgeInsets.only(left: 16.0, right:16.0, bottom:16.0 ),
                child: GridView.builder( 
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 60.0,
                    crossAxisSpacing: 0.0
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 44.0),
                  itemCount: lunchList.length,
                  itemBuilder:(context, index) { 
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FoodDetails(
                          index,
                          lunchList[index]["image"],
                          lunchList[index]["name"],
                          lunchList[index]["time"],
                          lunchList[index]["level"],
                          lunchList[index]["ingredients"],
                          lunchList[index]["procedure"]
                        ),
                        ),
                        ),
                      child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 200.0,
                          width: 170.0,
                          padding: EdgeInsets.only(bottom: 24.0),
                          decoration: BoxDecoration(
                            color: cLightGreyColor,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Text(lunchList[index]['name'],
                                 overflow: TextOverflow.ellipsis,
                                 maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: cLightFontColor,
                                ),),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: 
                                  List.generate(5, (index) => 
                                  Icon(Icons.star, color: Colors.yellow, size: 16.0,),
                                  )
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${lunchList[index]["time"]} \nMin ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: cLightFontColor,
                                    fontWeight: FontWeight.w400
                                  ),),
                                  Column(
                                    children: List.generate(6, (index) => Container(
                                      height: 2.0,
                                      width:2.0,
                                      margin: EdgeInsets.only(bottom:2),
                                      decoration: BoxDecoration(
                                         color: cDarkGreyFontColor,
                                         borderRadius: BorderRadius.circular(2.0)
                                      ),
                                    )),
                                  ),
                                  Text(
                                    "${lunchList[index]["level"]} \nLevel ",
                                   textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: cLightFontColor,
                                    fontWeight: FontWeight.w400
                                  ),),
                                ],
                              )  
                            ],
                          ),
                        ),
                        Positioned(
                          top: -170.0,
                          bottom: 0.0,
                          left: 1.0,
                          right: 0.0,
                          child: Container(
                            child: Hero(
                              tag: "tag$index",
                              child: Image.asset(lunchList[index]['image'],
                              height: 10,
                              ),
                            ),
                          ),
                        )
                      ],              ),
                    ); },
                ),
              ) : Center(),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget buildUppername(Users user) =>
   Row(
      children: [
        Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Hello ",
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w800,
                                color: cAccentColor,
                              ),
                            ),
                            TextSpan(
                              text: user.nickname,
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w800,
                                color: cAccentColor,
                              ),
                            ),
                            TextSpan(
                              text: "!",
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w800,
                                color: cAccentColor,
                              ),
                            ),
                            TextSpan(
                              text: "\nWhat are your cravings for today's?",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: cLightGreyColor,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      GestureDetector(
                      onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Profile(),
                                  ),
                                ),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                            height: 60,
                            child: CircleAvatar(
                              maxRadius: 30.0,
                              minRadius: 30.0,
                              backgroundColor: cAccentColor,
                              backgroundImage: NetworkImage(user.image)
                            ),
                          ),
                          
                          ],
                        ),
                      ),
                    )



      ],
    );
  
  Widget read(uid) {
    var collection = FirebaseFirestore.instance.collection('Users');
    return Column(
      children: [
        SizedBox(
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: collection.doc(uid).snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');

              if (snapshot.hasData) {
                final users = snapshot.data!.data();
                final newUser = Users(
                  id: users!['id'],
                  nickname: users['name'],
                  age: users['age'],
                  password: users['password'],
                  email: users['email'],
                  image: users['image']
                );

                return buildUppername(newUser);
                
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}