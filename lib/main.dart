import 'package:flutter/material.dart';

void main() {
  runApp(const ECommerceApp());
}

const Color primaryColor = Color(0xFF6750A4);
const Color backgroundColor = Color(0xFFF7F6FB);

class ECommerceApp extends StatefulWidget {
  const ECommerceApp({super.key});

  @override
  State<ECommerceApp> createState() => _ECommerceAppState();
}

class _ECommerceAppState extends State<ECommerceApp> {
  bool isDarkMode = false;

  void toggleTheme() => setState(() => isDarkMode = !isDarkMode);

  @override
  Widget build(BuildContext context) {
    final lightScheme = ColorScheme.fromSeed(seedColor: primaryColor);
    final darkScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      title: 'PixelMart - Digital Marketplace',
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightScheme,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(color: Colors.white, elevation: 1),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkScheme,
        scaffoldBackgroundColor: const Color(0xFF121218),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1C1B22),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: const CardThemeData(color: Color(0xFF22212A), elevation: 1),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF22212A),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      home: MainNavigationWrapper(
        isDarkMode: isDarkMode,
        onToggleTheme: toggleTheme,
      ),
    );
  }
}

// PRODUCT MODEL

class Product {
  final String name;
  final String category;
  final String description;
  final String image;
  final double price;
  final IconData icon;

  Product({
    required this.name,
    required this.category,
    required this.description,
    required this.image,
    required this.price,
    required this.icon,
  });
}

// SAMPLE PRODUCTS

final List<Product> sampleProducts = [
  Product(
    name: 'Wireless Headphones',
    category: 'Electronics',
    description: 'Comfortable headphones for music and online classes.',
    image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600',
    price: 1299,
    icon: Icons.headphones,
  ),
  Product(
    name: 'Laptop Computer',
    category: 'Electronics',
    description: 'A laptop for studying, programming, and office work.',
    image: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600',
    price: 24999,
    icon: Icons.laptop,
  ),
  Product(
    name: 'Smart Watch',
    category: 'Electronics',
    description: 'A modern smartwatch for your everyday activities.',
    image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600',
    price: 1899,
    icon: Icons.watch,
  ),
  Product(
    name: 'Wireless Mouse',
    category: 'Electronics',
    description: 'A convenient mouse for your laptop or computer.',
    image: 'https://images.unsplash.com/photo-1527814050087-3793815479db?w=600',
    price: 499,
    icon: Icons.mouse,
  ),
  Product(
    name: 'Modern Chair',
    category: 'Furniture',
    description: 'A comfortable chair for studying and working.',
    image: 'https://images.unsplash.com/photo-1503602642458-232111445657?w=600',
    price: 2499,
    icon: Icons.chair,
  ),
  Product(
    name: 'Study Desk',
    category: 'Furniture',
    description: 'A simple desk for your home study area.',
    image: 'https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=600',
    price: 3999,
    icon: Icons.desk,
  ),
  Product(
    name: 'Modern Bookshelf',
    category: 'Furniture',
    description: 'Keep your books and school materials organized.',
    image: 'https://images.unsplash.com/photo-1594620302200-9a762244a156?w=600',
    price: 3299,
    icon: Icons.shelves,
  ),
  Product(
    name: 'School Backpack',
    category: 'School Supplies',
    description: 'A useful backpack for school and everyday use.',
    image: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=600',
    price: 899,
    icon: Icons.backpack,
  ),
  Product(
    name: 'Notebook Set',
    category: 'School Supplies',
    description: 'Notebooks for your notes, lessons, and assignments.',
    image: 'https://images.unsplash.com/photo-1531346878377-a5be20888e57?w=600',
    price: 199,
    icon: Icons.menu_book,
  ),
  Product(
    name: 'School Stationery',
    category: 'School Supplies',
    description: 'Useful stationery for school projects and activities.',
    image: 'https://images.unsplash.com/photo-1455390582262-044cdead277a?w=600',
    price: 249,
    icon: Icons.edit,
  ),
  Product(
    name: 'Desk Lamp',
    category: 'Furniture',
    description: 'A desk lamp for reading and nighttime studying.',
    image: 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=600',
    price: 699,
    icon: Icons.light,
  ),
  Product(
    name: 'Tablet Device',
    category: 'Electronics',
    description: 'A portable device for reading and online learning.',
    image: 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=600',
    price: 8999,
    icon: Icons.tablet,
  ),
];

// MAIN NAVIGATION

class MainNavigationWrapper extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const MainNavigationWrapper({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int currentIndex = 0;

  final List<Product> products = List.from(sampleProducts);
  final Map<Product, int> cart = {};
  final Set<Product> wishlist = {};

  void addToCart(Product product) {
    setState(() {
      cart[product] = (cart[product] ?? 0) + 1;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void removeFromCart(Product product) {
    setState(() {
      cart.remove(product);
    });
  }

  void changeQuantity(Product product, int amount) {
    setState(() {
      final newQuantity = (cart[product] ?? 0) + amount;

      if (newQuantity <= 0) {
        cart.remove(product);
      } else {
        cart[product] = newQuantity;
      }
    });
  }

  void clearCart() {
    setState(() => cart.clear());
  }

  void toggleWishlist(Product product) {
    setState(() {
      if (wishlist.contains(product)) {
        wishlist.remove(product);
      } else {
        wishlist.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(
        products: products,
        wishlist: wishlist,
        onAddToCart: addToCart,
        onToggleWishlist: toggleWishlist,
        isDarkMode: widget.isDarkMode,
        onToggleTheme: widget.onToggleTheme,
        onAddProduct: (product) {
          setState(() => products.insert(0, product));
        },
      ),
      SearchPage(
        products: products,
        onAddToCart: addToCart,
        wishlist: wishlist,
        onToggleWishlist: toggleWishlist,
      ),
      CartPage(
        cart: cart,
        onQuantityChange: changeQuantity,
        onRemove: removeFromCart,
        onOrderComplete: clearCart,
      ),
      const ScannerPage(),
      ProfilePage(
        wishlist: wishlist,
        products: products,
        onAddToCart: addToCart,
        onToggleWishlist: toggleWishlist,
        isDarkMode: widget.isDarkMode,
        onToggleTheme: widget.onToggleTheme,
      ),
    ];

    final cartCount = cart.values.fold<int>(
      0,
      (sum, quantity) => sum + quantity,
    );

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() => currentIndex = index);
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: cartCount > 0,
              label: Text('$cartCount'),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            selectedIcon: Badge(
              isLabelVisible: cartCount > 0,
              label: Text('$cartCount'),
              child: const Icon(Icons.shopping_cart),
            ),
            label: 'Cart',
          ),
          const NavigationDestination(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scanner',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// REUSABLE PRODUCT CARD

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onAddToCart;
  final VoidCallback onToggleWishlist;

  const ProductCard({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onAddToCart,
    required this.onToggleWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).cardColor,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFFECE8F8),
                      child: Icon(product.icon, size: 52, color: primaryColor),
                    );
                  },
                ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Material(
                    color: Colors.white.withAlpha(230),
                    shape: const CircleBorder(),
                    child: IconButton(
                      onPressed: onToggleWishlist,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black87,
                      ),
                      iconSize: 19,
                      constraints: const BoxConstraints(
                        minWidth: 36,
                        minHeight: 36,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 9, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '₱${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: onAddToCart,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      minimumSize: const Size(0, 34),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// HOME PAGE

class HomePage extends StatefulWidget {
  final List<Product> products;
  final Set<Product> wishlist;
  final ValueChanged<Product> onAddToCart;
  final ValueChanged<Product> onToggleWishlist;
  final ValueChanged<Product> onAddProduct;
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.products,
    required this.wishlist,
    required this.onAddToCart,
    required this.onToggleWishlist,
    required this.onAddProduct,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';

  final categories = ['All', 'Electronics', 'Furniture', 'School Supplies'];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = widget.products.where((product) {
      return selectedCategory == 'All' || product.category == selectedCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PixelMart',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            Text(
              'Digital Market Place And Shopping System',
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: widget.isDarkMode
                ? 'Switch to light mode'
                : 'Switch to dark mode',
            onPressed: widget.onToggleTheme,
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
          IconButton(
            tooltip: 'Add product',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddProductPage(onSave: widget.onAddProduct),
              ),
            ),
            icon: const Icon(Icons.add_box_outlined),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SEARCH BAR
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: primaryColor),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Find your favorite products',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // PROMOTION BANNER
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6750A4), Color(0xFF9B83DB)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'SHOP SMARTER!',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Everything You Need',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Electronics, furniture and school supplies.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 14),
                              FilledButton.tonal(
                                onPressed: () {
                                  setState(() {
                                    selectedCategory = 'All';
                                  });
                                },
                                child: const Text('Explore Products'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.shopping_bag,
                          size: 65,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // CATEGORY HEADER
                  const Text(
                    'Shop by Category',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: 105,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _categoryCard(
                          'Electronics',
                          Icons.devices,
                          const Color(0xFFE2E9FF),
                        ),
                        _categoryCard(
                          'Furniture',
                          Icons.chair_alt,
                          const Color(0xFFFFE9D9),
                        ),
                        _categoryCard(
                          'School Supplies',
                          Icons.school,
                          const Color(0xFFDDF5E4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // PRODUCT HEADER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular Products',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${filteredProducts.length} items',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // FILTER CHIPS
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories.map((category) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(category),
                            selected: selectedCategory == category,
                            onSelected: (_) {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),

          // PRODUCT GRID
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.crossAxisExtent;
                final columns = width >= 700 ? 4 : 2;

                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 285,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final product = filteredProducts[index];

                    return ProductCard(
                      product: product,
                      isFavorite: widget.wishlist.contains(product),
                      onAddToCart: () => widget.onAddToCart(product),
                      onToggleWishlist: () => widget.onToggleWishlist(product),
                    );
                  }, childCount: filteredProducts.length),
                );
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  Widget _categoryCard(String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },
      child: Container(
        width: 105,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: primaryColor),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// SEARCH PAGE

class SearchPage extends StatefulWidget {
  final List<Product> products;
  final ValueChanged<Product> onAddToCart;
  final Set<Product> wishlist;
  final ValueChanged<Product> onToggleWishlist;

  const SearchPage({
    super.key,
    required this.products,
    required this.onAddToCart,
    required this.wishlist,
    required this.onToggleWishlist,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final results = widget.products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase()) ||
          product.category.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Search Products')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) => setState(() => query = value),
              decoration: InputDecoration(
                hintText: 'Search products or categories...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: results.isEmpty
                ? const Center(child: Text('No products found.'))
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: results.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 285,
                        ),
                    itemBuilder: (context, index) {
                      final product = results[index];

                      return ProductCard(
                        product: product,
                        isFavorite: widget.wishlist.contains(product),
                        onAddToCart: () => widget.onAddToCart(product),
                        onToggleWishlist: () =>
                            widget.onToggleWishlist(product),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// CART PAGE

class CartPage extends StatelessWidget {
  final Map<Product, int> cart;
  final void Function(Product, int) onQuantityChange;
  final ValueChanged<Product> onRemove;
  final VoidCallback onOrderComplete;

  const CartPage({
    super.key,
    required this.cart,
    required this.onQuantityChange,
    required this.onRemove,
    required this.onOrderComplete,
  });

  @override
  Widget build(BuildContext context) {
    final entries = cart.entries.toList();
    final total = cart.entries.fold<double>(
      0,
      (sum, entry) => sum + entry.key.price * entry.value,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('My Shopping Cart')),
      body: entries.isEmpty
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text('Your cart is empty', style: TextStyle(fontSize: 18)),
                  Text(
                    'Add products to start shopping!',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: entries.length,
                    itemBuilder: (context, index) {
                      final product = entries[index].key;
                      final quantity = entries[index].value;
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  product.image,
                                  width: 85,
                                  height: 85,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    width: 85,
                                    height: 85,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceContainerHighest,
                                    child: Icon(product.icon, size: 35),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '₱${product.price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () =>
                                              onQuantityChange(product, -1),
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                          ),
                                        ),
                                        Text('$quantity'),
                                        IconButton(
                                          onPressed: () =>
                                              onQuantityChange(product, 1),
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () => onRemove(product),
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Theme.of(context).cardColor,
                  child: SafeArea(
                    top: false,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Amount',
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              '₱${total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: FilledButton.icon(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CheckoutPage(
                                  cart: Map<Product, int>.from(cart),
                                  total: total,
                                  onOrderComplete: onOrderComplete,
                                ),
                              ),
                            ),
                            icon: const Icon(Icons.lock_outline),
                            label: const Text('Proceed to Secure Checkout'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

// CHECKOUT PAGE: simulated payment flow; connect a payment provider for real transactions.
class CheckoutPage extends StatefulWidget {
  final Map<Product, int> cart;
  final double total;
  final VoidCallback onOrderComplete;

  const CheckoutPage({
    super.key,
    required this.cart,
    required this.total,
    required this.onOrderComplete,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final postalController = TextEditingController();
  final referenceController = TextEditingController();
  String paymentMethod = 'Cash on Delivery';
  bool processing = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    postalController.dispose();
    referenceController.dispose();
    super.dispose();
  }

  String? requiredField(String? value, String label) {
    if (value == null || value.trim().isEmpty) return '$label is required';
    return null;
  }

  Future<void> placeOrder() async {
    if (!formKey.currentState!.validate()) return;
    setState(() => processing = true);
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;
    setState(() => processing = false);

    final isCash = paymentMethod == 'Cash on Delivery';
    final orderNumber =
        'PM${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        icon: Icon(
          isCash ? Icons.local_shipping_outlined : Icons.hourglass_top_rounded,
          size: 42,
          color: primaryColor,
        ),
        title: Text(
          isCash ? 'Confirm Cash on Delivery' : 'Payment Demo Confirmation',
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order #$orderNumber',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Customer: ${nameController.text.trim()}'),
              Text('Phone: ${phoneController.text.trim()}'),
              Text(
                'Deliver to: ${addressController.text.trim()}, ${cityController.text.trim()} ${postalController.text.trim()}',
              ),
              const Divider(height: 24),
              Text('Payment: $paymentMethod'),
              Text(
                'Total: ₱${widget.total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                isCash
                    ? 'You will pay the delivery person when your order arrives.'
                    : 'This demo cannot collect money or verify a real payment. No charge will be made. A payment provider must be connected before going live.',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Go Back'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Confirm Order'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      widget.onOrderComplete();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Order #$orderNumber placed successfully. ${isCash ? 'Payment due on delivery.' : 'Payment is not processed in this demo.'}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDigital = paymentMethod != 'Cash on Delivery';
    return Scaffold(
      appBar: AppBar(title: const Text('Secure Checkout')),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                const Icon(Icons.verified_user_outlined, color: primaryColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Delivery details',
                    style: Theme.of(context).textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Text(
              'Enter where we should deliver your order.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Full name',
                prefixIcon: Icon(Icons.person_outline),
              ),
              validator: (v) => requiredField(v, 'Full name'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Mobile number',
                prefixIcon: Icon(Icons.phone_outlined),
                hintText: '09XXXXXXXXX',
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty)
                  return 'Mobile number is required';
                if (v.replaceAll(RegExp(r'[^0-9+]'), '').length < 10)
                  return 'Enter a valid phone number';
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email (optional)',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: (v) {
                if (v != null &&
                    v.trim().isNotEmpty &&
                    !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim()))
                  return 'Enter a valid email address';
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: addressController,
              maxLines: 2,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'House number, street, barangay',
                prefixIcon: Icon(Icons.home_outlined),
                alignLabelWithHint: true,
              ),
              validator: (v) => requiredField(v, 'Delivery address'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: cityController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      labelText: 'City / Municipality',
                    ),
                    validator: (v) => requiredField(v, 'City or municipality'),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 112,
                  child: TextFormField(
                    controller: postalController,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    decoration: const InputDecoration(
                      labelText: 'ZIP code',
                      counterText: '',
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return 'Required';
                      if (!RegExp(r'^\d{4}$').hasMatch(v.trim()))
                        return 'Use 4 digits';
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Payment method',
              style: Theme.of(context).textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  RadioListTile<String>(
                    value: 'Cash on Delivery',
                    groupValue: paymentMethod,
                    onChanged: (v) => setState(() => paymentMethod = v!),
                    secondary: const Icon(Icons.local_shipping_outlined),
                    title: const Text('Cash on Delivery'),
                    subtitle: const Text('Pay when your order arrives'),
                  ),
                  const Divider(height: 1),
                  RadioListTile<String>(
                    value: 'GCash',
                    groupValue: paymentMethod,
                    onChanged: (v) => setState(() => paymentMethod = v!),
                    secondary: const Icon(
                      Icons.account_balance_wallet_outlined,
                    ),
                    title: const Text('GCash'),
                    subtitle: const Text('Mobile wallet — demo only'),
                  ),
                  const Divider(height: 1),
                  RadioListTile<String>(
                    value: 'Maya',
                    groupValue: paymentMethod,
                    onChanged: (v) => setState(() => paymentMethod = v!),
                    secondary: const Icon(Icons.payment_outlined),
                    title: const Text('Maya'),
                    subtitle: const Text('Mobile wallet — demo only'),
                  ),
                ],
              ),
            ),
            if (isDigital) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Digital payment preview',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'In a live store, you would be redirected to the selected wallet or a secure payment gateway. This sample app does not charge you or verify payments. Do not enter your wallet PIN or password here.',
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Items',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '${widget.cart.values.fold<int>(0, (a, b) => a + b)}',
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Delivery',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Text(
                          'FREE',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total to pay',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '₱${widget.total.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 21,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 52,
              child: FilledButton.icon(
                onPressed: processing ? null : placeOrder,
                icon: processing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.lock_outline),
                label: Text(
                  processing ? 'Processing...' : 'Review & Place Order',
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Demo checkout: order details are not stored on a server. Real wallet payments require a payment provider integration.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ADD PRODUCT PAGE

class AddProductPage extends StatefulWidget {
  final ValueChanged<Product> onSave;

  const AddProductPage({super.key, required this.onSave});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  String category = 'Electronics';

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Product')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(
                  Icons.add_shopping_cart,
                  size: 65,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Product Details',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _field(nameController, 'Product Name', 'Enter product name'),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: category,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Electronics',
                    child: Text('Electronics'),
                  ),
                  DropdownMenuItem(
                    value: 'Furniture',
                    child: Text('Furniture'),
                  ),
                  DropdownMenuItem(
                    value: 'School Supplies',
                    child: Text('School Supplies'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) setState(() => category = value);
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: priceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Price (₱)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final price = double.tryParse(value ?? '');
                  if (price == null || price <= 0) {
                    return 'Enter a valid price greater than zero';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _field(
                descriptionController,
                'Description',
                'Enter product description',
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: imageController,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  labelText: 'Image URL (optional)',
                  hintText: 'https://example.com/image.jpg',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton.icon(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;

                    final image = imageController.text.trim();

                    final product = Product(
                      name: nameController.text.trim(),
                      category: category,
                      description: descriptionController.text.trim(),
                      price: double.parse(priceController.text.trim()),
                      image: image.isEmpty
                          ? 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600'
                          : image,
                      icon: category == 'Electronics'
                          ? Icons.devices
                          : category == 'Furniture'
                          ? Icons.chair
                          : Icons.school,
                    );

                    widget.onSave(product);
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Product added successfully!'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Save Product'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String label,
    String hint, {
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$label is required';
        }
        return null;
      },
    );
  }
}

// SCANNER PAGE

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Scanner')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: const Color(0xFFECE6FA),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.qr_code_scanner,
                  size: 100,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Scan a Product',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'The scanner interface is ready for integration. '
                'Camera scanning requires an additional package.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// PROFILE PAGE: local demo sign-in form. Connect Firebase/Auth API for real accounts.
class ProfilePage extends StatefulWidget {
  final Set<Product> wishlist;
  final List<Product> products;
  final ValueChanged<Product> onAddToCart;
  final ValueChanged<Product> onToggleWishlist;
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const ProfilePage({
    super.key,
    required this.wishlist,
    required this.products,
    required this.onAddToCart,
    required this.onToggleWishlist,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoggedIn = false;
  bool isCreatingAccount = false;
  bool obscurePassword = true;
  String accountName = '';
  String accountEmail = '';

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submitLogin() {
    if (!formKey.currentState!.validate()) return;
    setState(() {
      isLoggedIn = true;
      accountEmail = emailController.text.trim();
      accountName = isCreatingAccount && nameController.text.trim().isNotEmpty
          ? nameController.text.trim()
          : (emailController.text.trim().split('@').first);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isCreatingAccount
              ? 'Demo account created!'
              : 'Welcome back, $accountName!',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoggedIn) return _buildLoginPage(context);
    return _buildProfilePage(context);
  }

  Widget _buildLoginPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your PixelMart Account'),
        actions: [
          IconButton(
            tooltip: widget.isDarkMode ? 'Light mode' : 'Dark mode',
            onPressed: widget.onToggleTheme,
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 92,
                    height: 92,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.shopping_bag_rounded,
                      size: 48,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    isCreatingAccount ? 'Create your account' : 'Welcome back!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isCreatingAccount
                        ? 'Join PixelMart and keep your shopping organized.'
                        : 'Sign in to view your profile and wishlist.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 28),
                  if (isCreatingAccount) ...[
                    TextFormField(
                      controller: nameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        labelText: 'Full name',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      validator: (v) =>
                          isCreatingAccount && (v == null || v.trim().isEmpty)
                          ? 'Enter your name'
                          : null,
                    ),
                    const SizedBox(height: 14),
                  ],
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email address',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty)
                        return 'Enter your email address';
                      if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                          .hasMatch(v.trim()))
                        return 'Enter a valid email address';
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: passwordController,
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => obscurePassword = !obscurePassword),
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Enter your password';
                      if (v.length < 6) return 'Use at least 6 characters';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: FilledButton(
                      onPressed: submitLogin,
                      child: Text(
                        isCreatingAccount ? 'Create Account' : 'Sign In',
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () =>
                        setState(() => isCreatingAccount = !isCreatingAccount),
                    child: Text(
                      isCreatingAccount
                          ? 'Already have an account? Sign in'
                          : 'New to PixelMart? Create an account',
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Demo sign-in only: this form does not authenticate with a server or create a secure account. Connect Firebase Authentication or your backend before using real customer accounts.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            tooltip: widget.isDarkMode
                ? 'Switch to light mode'
                : 'Switch to dark mode',
            onPressed: widget.onToggleTheme,
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
          IconButton(
            tooltip: 'Sign out',
            onPressed: () => setState(() {
              isLoggedIn = false;
              passwordController.clear();
            }),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 8),
          CircleAvatar(
            radius: 48,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: const Icon(Icons.person, size: 56, color: primaryColor),
          ),
          const SizedBox(height: 12),
          Text(
            accountName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          Text(
            accountEmail,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.favorite, color: Colors.red),
                  title: const Text('My Wishlist'),
                  trailing: Text('${widget.wishlist.length} items'),
                ),
                const Divider(height: 1),
                const ListTile(
                  leading: Icon(Icons.shopping_bag_outlined),
                  title: Text('My Orders'),
                  subtitle: Text(
                    'Order history will appear here after backend integration',
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  ),
                  title: const Text('Appearance'),
                  subtitle: Text(
                    widget.isDarkMode ? 'Dark mode is on' : 'Light mode is on',
                  ),
                  trailing: Switch(
                    value: widget.isDarkMode,
                    onChanged: (_) => widget.onToggleTheme(),
                  ),
                ),
                const Divider(height: 1),
                const ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text('Help and Support'),
                  subtitle: Text('Contact support for help with your orders'),
                ),
              ],
            ),
          ),
          if (widget.wishlist.isNotEmpty) ...[
            const SizedBox(height: 24),
            const Text(
              'My Wishlist',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...widget.wishlist.map(
              (product) => Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product.image,
                      width: 55,
                      height: 55,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Icon(product.icon, size: 35),
                    ),
                  ),
                  title: Text(product.name),
                  subtitle: Text('₱${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () => widget.onAddToCart(product),
                  ),
                ),
              ),
            ),
          ],
          const SizedBox(height: 20),
          Center(
            child: Text(
              '${widget.products.length} products available in PixelMart',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
