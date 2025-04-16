import 'package:cosmetic_app/models/product_model.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  var products = <Product>[].obs;
  var searchQuery = ''.obs;
  var selectedCategory = 'All'.obs;
  var selectedSubCategory = 'All'.obs;
  var pageTitle = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() {
    products.assignAll([
//Favourites

      Product(
          name: 'Lip Gloss',
          brand: 'Fenty Beauty',
          price: 26,
          image: 'new_arrivals/lip gloss.png',
          category: 'Favourites',
          subCategory: 'Makeup'),

      Product(
          name: 'Facewash',
          brand: 'Simple',
          price: 8,
          image: 'new_arrivals/facewash.png',
          category: 'Favourites',
          subCategory: 'Skincare'),
      Product(
          name: 'Wrinkle Cream',
          brand: 'Clinique',
          price: 47,
          image: 'new_arrivals/winklecream new.png',
          category: 'Favourites',
          subCategory: 'Skincare'),

      Product(
          name: 'Hair Mask',
          brand: 'OUAI',
          price: 65,
          image: 'new_arrivals/hair mask.png',
          category: 'Favourites',
          subCategory: 'Hair Care'),

      Product(
          name: 'Fragrance',
          brand: 'Killian',
          price: 200,
          image: 'new_arrivals/fragrance1.png',
          category: 'Favourites',
          subCategory: 'Fragrances'),

      Product(
          name: 'Fragrance',
          brand: 'Kay Ali',
          price: 95,
          image: 'new_arrivals/fragrance2.png',
          category: 'Favourites',
          subCategory: 'Fragrances'),

      // New Arrivals
      Product(
          name: 'Blush Stick',
          brand: 'Makeup by Mario',
          price: 32,
          image: 'new_arrivals/blush_stick.png',
          category: 'New Arrivals',
          subCategory: 'Makeup'),
      Product(
          name: 'Eye Liner',
          brand: 'Inglot',
          price: 15,
          image: 'new_arrivals/eye_liner.png',
          category: 'New Arrivals',
          subCategory: 'Makeup'),
      Product(
          name: 'Concealer',
          brand: 'Elf Cosmetics',
          price: 45,
          image: 'new_arrivals/concealer.png',
          category: 'New Arrivals',
          subCategory: 'Skincare'),
      Product(
          name: 'Blush',
          brand: 'Rare Beauty',
          price: 40,
          image: 'new_arrivals/blush.png',
          category: 'New Arrivals',
          subCategory: 'Makeup'),
      Product(
          name: 'Hair Mask',
          brand: 'Gisou',
          price: 50,
          image: 'new_arrivals/hair_mask.png',
          category: 'New Arrivals',
          subCategory: 'Hair Care'),
      Product(
          name: 'Eye Liner',
          brand: 'Inglot',
          price: 15,
          image: 'new_arrivals/eye_liner.png',
          category: 'New Arrivals',
          subCategory: 'Makeup'),
      Product(
          name: 'Lip Gloss',
          brand: 'Fenty Beauty',
          price: 26,
          image: 'new_arrivals/lip gloss.png',
          category: 'New Arrivals',
          subCategory: 'Makeup'),
      Product(
          name: 'Hair Mask',
          brand: 'OUAI',
          price: 65,
          image: 'new_arrivals/hair mask.png',
          category: 'New Arrivals',
          subCategory: 'Makeup'),
      Product(
          name: 'Fragrance',
          brand: 'Killian',
          price: 200,
          image: 'new_arrivals/fragrance1.png',
          category: 'New Arrivals',
          subCategory: 'Fragrances'),
      Product(
          name: 'Facewash',
          brand: 'Simple',
          price: 8,
          image: 'new_arrivals/facewash.png',
          category: 'New Arrivals',
          subCategory: 'Skincare'),
      Product(
          name: 'Fragrance',
          brand: 'Kay Ali',
          price: 95,
          image: 'new_arrivals/fragrance2.png',
          category: 'New Arrivals',
          subCategory: 'Fragrances'),
      Product(
          name: 'Wrinkle Cream',
          brand: 'Clinique',
          price: 47,
          image: 'new_arrivals/winklecream new.png',
          category: 'New Arrivals',
          subCategory: 'Makeup'),

      // Recommended

      Product(
          name: 'Foundation',
          brand: 'Mac Studio',
          price: 47,
          image: 'recommended/foundation.png',
          category: 'Recommendations',
          subCategory: 'Makeup'),
      Product(
          name: 'Mascara',
          brand: 'Maybelline',
          price: 10,
          image: 'recommended/mascara maybelline.png',
          category: 'Recommendations',
          subCategory: 'Makeup'),
      Product(
          name: 'Highlighter',
          brand: 'Charlotte Tilbury',
          price: 55,
          image: 'recommended/highlighter charlotte.png',
          category: 'Recommendations',
          subCategory: 'Makeup'),
      Product(
          name: 'Lipstick',
          brand: 'YSL',
          price: 35,
          image: 'recommended/lipstick.png',
          category: 'Recommendations',
          subCategory: 'Makeup'),
      Product(
          name: 'Blush Brush',
          brand: 'Bobbi Brown',
          price: 55,
          image: 'recommended/blush bursh.png',
          category: 'Recommendations',
          subCategory: 'Makeup'),
      Product(
          name: 'Highlighter Stick',
          brand: 'Fenty Beauty',
          price: 38,
          image: 'recommended/highhlighter stick.png',
          category: 'Recommendations',
          subCategory: 'Makeup'),

      Product(
          name: 'Facewash',
          brand: 'Neutrogena',
          price: 14,
          image: 'recommended/facewash neutrogena.png',
          category: 'Recommendations',
          subCategory: 'Skincare'),
      Product(
          name: 'Face Serum',
          brand: 'Beauty of Joseon',
          price: 47,
          image: 'recommended/facewserum.png',
          category: 'Recommendations',
          subCategory: 'Skincare'),
      Product(
          name: 'Naicinimide Serum',
          brand: 'Glow Recipie',
          price: 55,
          image: 'recommended/facewash neutrogena.png',
          category: 'Recommendations',
          subCategory: 'Skincare'),
      Product(
          name: 'Moisturizer',
          brand: 'Aveeno',
          price: 25,
          image: 'recommended/moisturizer.png',
          category: 'Recommendations',
          subCategory: 'Skincare'),
      Product(
          name: 'Eye Cream',
          brand: 'Cera Ve',
          price: 55,
          image: 'recommended/eye cream.png',
          category: 'Recommendations',
          subCategory: 'Skincare'),
      Product(
          name: 'Facewash',
          brand: 'Nivea',
          price: 14,
          image: 'recommended/facewash nivea.png',
          category: 'Recommendations',
          subCategory: 'Skincare'),

      Product(
          name: 'Hair Mask',
          brand: 'Fino',
          price: 48,
          image: 'recommended/hair mask fino.png',
          category: 'Recommendations',
          subCategory: 'Hair Care'),
      Product(
          name: 'Hair Mask',
          brand: 'OUAI',
          price: 65,
          image: 'recommended/hair mask.png',
          category: 'Recommendations',
          subCategory: 'Hair Care'),
      Product(
          name: 'Hair Oil',
          brand: 'OUAI',
          price: 58,
          image: 'recommended/hair oil.png',
          category: 'Recommendations',
          subCategory: 'Hair Care'),
      Product(
          name: 'Dry Shampoo',
          brand: 'Baliste',
          price: 10,
          image: 'recommended/dry shampoo.png',
          category: 'Recommendations',
          subCategory: 'Hair Care'),
      Product(
          name: 'Shampoo',
          brand: 'OGX',
          price: 58,
          image: 'recommended/shampo OGX.png',
          category: 'Recommendations',
          subCategory: 'Hair Care'),
      Product(
          name: 'Wooden Comb',
          brand: 'Maarjan',
          price: 10,
          image: 'new_arrivals/wooden comb.png',
          category: 'Recommendations',
          subCategory: 'Hair Care'),

      Product(
          name: 'Fragrance',
          brand: 'Louis Vuitton',
          price: 200,
          image: 'recommended/louis vuitton fragrance.png',
          category: 'Recommendations',
          subCategory: 'Fragrances'),
      Product(
          name: 'Fragrance',
          brand: 'Victoria Secret',
          price: 110,
          image: 'recommended/victoria secrect fragrance.png',
          category: 'Recommendations',
          subCategory: 'Fragrances'),
      Product(
          name: 'Fragrance',
          brand: 'Dior',
          price: 120,
          image: 'recommended/drio fragance.png',
          category: 'Recommendations',
          subCategory: 'Fragrances'),
      Product(
          name: 'Fragrance',
          brand: 'Versace',
          price: 140,
          image: 'recommended/versace fragances.png',
          category: 'Recommendations',
          subCategory: 'Fragrances'),
      Product(
          name: 'Fragrance',
          brand: 'Miss Dior',
          price: 180,
          image: 'recommended/miss dior fragrances.png',
          category: 'Recommendations',
          subCategory: 'Fragrances'),
      Product(
          name: 'Fragrance',
          brand: 'Latafa',
          price: 75,
          image: 'recommended/latafa frafrance.png',
          category: 'Recommendations',
          subCategory: 'Fragrances'),

      // Sale Products
      Product(
          name: 'Lipstick',
          brand: 'Dior',
          price: 38,
          image: 'Sale Product/lipstick.png',
          category: 'Sale Products',
          subCategory: 'Makeup',
          discount: 10),
      Product(
          name: 'Eye Palette',
          brand: 'Anastasia',
          price: 45,
          image: 'Sale Product/eye palette.png',
          category: 'Sale Products',
          subCategory: 'Makeup',
          discount: 25),
      Product(
          name: 'Color Corrector',
          brand: 'Huda Beauty',
          price: 30,
          image: 'Sale Product/color corrector.png',
          category: 'Sale Products',
          subCategory: 'Makeup',
          discount: 5),
      Product(
          name: 'Bronze',
          brand: 'Bobbi brown',
          price: 11,
          image: 'Sale Product/broze.png',
          category: 'Sale Products',
          subCategory: 'Makeup',
          discount: 5),
      Product(
          name: 'Setting Spray',
          brand: 'YSL',
          price: 38,
          image: 'Sale Product/setting spray.png',
          category: 'Sale Products',
          subCategory: 'Makeup',
          discount: 10),
      Product(
          name: 'Lip Gloss',
          brand: 'NYX',
          price: 11,
          image: 'Sale Product/lip gloss.png',
          category: 'Sale Products',
          subCategory: 'Makeup',
          discount: 10),

      Product(
          name: 'Pore Purifying Toner',
          brand: 'Garnier',
          price: 30,
          image: 'Sale Product/pore purifying.png',
          category: 'Sale Products',
          subCategory: 'Skincare',
          discount: 5),
      Product(
          name: 'Face Scrub',
          brand: 'Neutrogena',
          price: 17,
          image: 'Sale Product/facesrub.png',
          category: 'Sale Products',
          subCategory: 'Skincare',
          discount: 20),
      Product(
          name: 'Lip Mask',
          brand: 'Laneige',
          price: 4,
          image: 'Sale Product/lips mask.png',
          category: 'Sale Products',
          subCategory: 'Skincare',
          discount: 10),
      Product(
          name: 'Glycolic Acid Serum',
          brand: 'The Ordinary',
          price: 23,
          image: 'Sale Product/ordinary glcolic acid serum.png',
          category: 'Sale Products',
          subCategory: 'Skincare',
          discount: 5),
      Product(
          name: 'Toner Pads',
          brand: 'Anua',
          price: 35,
          image: 'Sale Product/toner anua.png',
          category: 'Sale Products',
          subCategory: 'Skincare',
          discount: 10),

      Product(
          name: 'Niacinimide Serum',
          brand: 'La Roche Posay',
          price: 26,
          image: 'Sale Product/niacinimide serum.png',
          category: 'Sale Products',
          subCategory: 'Skincare',
          discount: 10),

      Product(
        name: 'Hair Mask',
        brand: 'Gisou',
        price: 38,
        image: 'Sale Product/gisou hair mask.png',
        category: 'Sale Products',
        subCategory: 'Hair Care',
      ),

      Product(
          name: 'Hair Mask',
          brand: 'Elvine',
          price: 21,
          image: 'Sale Product/hairmask elvine.png',
          category: 'Sale Products',
          subCategory: 'Hair Care',
          discount: 5),
      Product(
          name: 'Heat Protecting Spray',
          brand: 'Blur FX',
          price: 12,
          image: 'Sale Product/blurfx heat protecting.png',
          category: 'Sale Products',
          subCategory: 'Hair Care',
          discount: 10),
      Product(
          name: 'Friz Control Serum',
          brand: 'John Frieda',
          price: 12,
          image: 'Sale Product/jhon frieda friz serum.png',
          category: 'Sale Products',
          subCategory: 'Hair Care',
          discount: 5),
      Product(
          name: 'Dentangling Coditioner',
          brand: 'Dove',
          price: 20,
          image: 'Sale Product/dove detangling.png',
          category: 'Sale Products',
          subCategory: 'Hair Care',
          discount: 10),
      Product(
          name: 'Hair Oil',
          brand: 'Granier',
          price: 26,
          image: 'Sale Product/hair oil garnier.png',
          category: 'Sale Products',
          subCategory: 'Hair Care',
          discount: 10),

      Product(
          name: 'Frigrance',
          brand: 'Giorgio Armani',
          price: 55,
          image: 'Sale Product/giorgio armani 2.png',
          category: 'Sale Products',
          subCategory: 'Fragrance',
          discount: 5),
      Product(
          name: 'Frigrance',
          brand: 'Giorgio Armani',
          price: 80,
          image: 'Sale Product/giorgioArmanifragrance.png',
          category: 'Sale Products',
          subCategory: 'Fragrance',
          discount: 17),
      Product(
          name: 'Frigrance',
          brand: 'Dior',
          price: 238,
          image: 'Sale Product/diorfragance.png',
          category: 'Sale Products',
          subCategory: 'Fragrance',
          discount: 10),
      Product(
          name: 'Frigrance',
          brand: 'Valentenio',
          price: 120,
          image: 'Sale Product/valentinofragrance.png',
          category: 'Sale Products',
          subCategory: 'Fragrance',
          discount: 5),
      Product(
          name: 'Frigrance',
          brand: 'Channel',
          price: 190,
          image: 'Sale Product/channelfragrance.png',
          category: 'Sale Products',
          subCategory: 'Fragrance',
          discount: 10),

      Product(
          name: 'Frigrance',
          brand: 'Gucci',
          price: 99,
          image: 'Sale Product/guccifragrance.png',
          category: 'Sale Products',
          subCategory: 'Fragrance',
          discount: 25),
    ]);
  }

  List<Product> get filteredProducts {
    return products.where((p) {
      bool categoryMatch = selectedCategory.value == 'All' ||
          p.category == selectedCategory.value;
      bool subCategoryMatch = selectedSubCategory.value == 'All' ||
          p.subCategory == selectedSubCategory.value;
      bool searchMatch =
          p.name.toLowerCase().contains(searchQuery.value.toLowerCase());
      bool pageMatch =
          (pageTitle.value == 'New Arrivals' && p.category == 'New Arrivals') ||
              (pageTitle.value == 'Recommendations' &&
                  p.category == 'Recommendations') ||
              (pageTitle.value == 'Sale Products' &&
                  p.category == 'Sale Products') ||
              (pageTitle.value == 'Favourites' && p.category == 'Favourites');
      return categoryMatch && subCategoryMatch && searchMatch && pageMatch;
    }).toList();
  }

    @override
  void onClose() {
    super.onClose();
    clearController();
  }

  void clearController() {
    products.clear();
    searchQuery.value = '';
    selectedCategory.value = 'All';
    selectedSubCategory.value = 'All';
    pageTitle.value = '';
  }
}
