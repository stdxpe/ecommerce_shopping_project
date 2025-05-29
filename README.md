# E-Commerce Project
### Premium Women Fashion Shopping App

Fully functional e-commerce application for portfolio, using **Flutter**, **Riverpod**, **Firebase**, **Hive** and **Stripe**.

![](https://github.com/stdxpe/ecommerce_shopping_project/blob/dev/readme_doc/readme_top_banner.jpg)

> Delivered core features, including wishlist, shopping cart, searching, advanced filtering and sorting, exploring latest trends, dynamic product collections, product reviews and ratings, order tracking capabilities and more, to provide an immersive shopping experience

![](https://github.com/stdxpe/ecommerce_shopping_project/blob/dev/readme_doc/dark_mode.jpg)


## Project Structure
```bash
├── lib
│   ├── *models
│   │   └── product.dart
│   │   └── order.dart
│   │   └── review.dart  
│   │   └── collection.dart
│   │   └── collection_dto.dart, ...
│   └── *services
│   │   └── auth_service.dart
│   │   └── user_service.dart
│   │   └── navigation_service.dart
│   │   └── storage_service.dart
│   │   └── local_db_service.dart
│   │   └── dependency_injection_service.dart
│   │   └── payment_service.dart
│   │   └── *abstract_classes
│   │       └── i_auth_service, i_user_service, ...
│   └── *business
│   │   └── wishlist_manager.dart
│   │   └── shopping_cart_manager.dart
│   │   └── order_manager.dart
│   │   └── user_manager.dart
│   │   └── profile_manager.dart
│   │   └── *abstract_classes
│   │       └── i_wishlist_repository.dart
│   │       └── i_shopping_cart_repository.dart, ...
│   └── *ui
│   │   └── *screens
│   │       └── splash_screen.dart
│   │       └── onboarding_screen.dart
│   │       └── discover_screen.dart
│   │       └── search_screen.dart
│   │       └── payment_screen.dart
│   │       └── tracking_order_screen.dart
│   │       └── collection_details_screen.dart, ...
│   │   └── *riverpod_providers
│   │       └── user_provider.dart
│   │       └── collection_provider.dart
│   │       └── filter_provider.dart
│   │       └── theme_mode_provider.dart
│   │       └── shopping_cart_providers.dart, ...
│   │   └── *widgets
│   │       └── *buttons/
│   │       └── *sliders/
│   │       └── *bottom_sheets/
│   │       └── *dialog_popups/
│   │       └── *listviews_and_gridviews/  ...
│   └── *utilities
│   │   └── k_app_themes.dart
│   │   └── k_text_themes.dart
│   │   └── k_color_palettes.dart
│   │   └── k_constants.dart
│   │   └── k_extensions.dart
│   │   └── k_validators.dart
│   │   └── k_text_input_formatters.dart, ...
│   └── *assets
│   │   └── *images/ *icons/ *svgs/ *lotties/ *fonts/ ...
│   ├── app_configuration.dart
│   ├── firebase_options.dart
│   └── main.dart
├── pubspec.yaml
├── gitignore
├── ENV_VAR
```
* Created a custom multi-layered architecture to ensure scalability, **separation of concerns**, minimum dependency, and loose coupling
  
![Alternate Text](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/4ktest.gif)

## Dependencies (on pubspec.yaml)
```yaml
###########################################################################################

  flutter_riverpod: ^2.5.1                # State Management Solution
  get_it: ^7.7.0                          # Dependency Injection Service
  go_router: ^14.2.2                      # Advanced Navigation & Routing System
  flutter_screenutil: ^5.9.3              # Responsive & Adaptive Design

  firebase_core: ^3.3.0                   # Firebase Services
  firebase_auth: ^5.1.4                   # Firebase Authentication Service
  google_sign_in: ^6.2.1                  # Google Authentication Service
  cloud_firestore: ^5.2.1                 # Firebase Cloud Database Service
  firebase_storage: ^12.1.3               # Firebase Cloud Storage Service

  flutter_stripe: ^11.1.0                 # Payment Service
  flutter_dotenv: ^5.1.0                  # Environment Variable Service
  dio: ^5.7.0                             # HTTP Networking Service
  hive: ^2.2.3                            # Local Database Service

  lottie: ^3.1.2                          # Optimized JSON Animations
  uuid: ^4.4.2                            # Random ID Generator
  intl: ^0.19.0                           # Date-Time Formatter
  faker_dart: ^0.2.2                      # Random Fake Data Generator
  cached_network_image: ^3.4.0            # Network Image Cacher
  flutter_credit_card: ^4.0.1             # Credit Card Validation
  card_swiper: ^3.0.1                     # Carousel Image Slider
  smooth_page_indicator: ^1.2.0+3         # Image Slider Pagination
  flutter_animate: ^4.5.0                 # Advanced Animation Builder
  image_picker: ^1.1.2                    # Upload from Device Gallery Functionality
  shimmer: ^3.0.0                         # Animated Card Placeholders for Loading State
  flutter_slidable: ^3.1.1                # Advanced Version of Flutter Dismissible Widget
  zoom_pinch_overlay: ^1.4.3              # Advanced Version of Flutter Interactive Widget
  ...
###########################################################################################
```
* Integrated **Stripe API** for the secure payment processing, ensuring seamless checkout flows with reliable and real-time transactions
* Utilized **Riverpod** for State Management, **get_it** for Dependency Injection, and **GoRouter** for advanced Navigation/Routing service 
* Designed a modern, responsive UI with **ScreenUtil** and **Figma**, customized color palettes, dynamic theming, and **Lottie** animations 
* Enabled **Google Sign-In** and **Firebase Auth** for real-time user authentication and smooth onboarding experience 
* Implemented **Firestore** and **Firebase Storage** for cloud database solution, and **Hive** for local device storage and caching mechanism 

![Alternate Text](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/4ktest.gif)

Designed as Multi-Layered Architecture in Monolith Pattern, with strict “Separation of Concerns” logic between layers.

Every service and manager class have derived from a separate abstract class/interface, to reduce layer dependencies to the absolute minimum. Therefore, changing an external source/package in the project can be easily managed by just switching Dependency Injection Service's (get_it) target abstract-concrete class selection, within seconds.

```dart
locator.registerLazySingleton<IStorageService>() => FirebaseStorageService()
```
to
```dart
locator.registerLazySingleton<IStorageService>() => AmazonStorageService()

```

Extra Note: Riverpod and get_it is alternative services to each other, in the terms of dependency injection and creating singleton objects when necessary. But using Riverpod-only and passing "ref" throughout the app and in/to all layers, is NOT sth I want particularly, which creates a huge dependency issue. Instead, I wanted Riverpod to be only responsible for updating UI. I tried to design in a way that we can change, even our State Management solution from Riverpod to Bloc with minimum effort, just by replacing Riverpod providers into Blocs/Cubits, and changing Consumers into BlocBuilders in the UI.


```dart
final wishlistProvider = AsyncNotifierProvider<WishlistNotifier, List<Product>>(
    () => WishlistNotifier());

class WishlistNotifier extends AsyncNotifier<List<Product>> {
  @override
  FutureOr<List<Product>> build() async {
    /// Initial State Setting Operation on start
    getWishlistProducts();

    /// Waiting for inner method to be completed
    return await future;
  }

  /// Static access to the related Abstract Class on Business Layer through Dependency Injector (therefore hardcoded)
  final _wishlistManager = locator<IWishlistRepository>();

  getWishlistProducts() async {
    debugPrint('WishlistNotifier | getWishlistProducts() Executed');

    /// Temporarily setting to loading state (so UI can easily preview loading animations while waiting for actual data)
    state = const AsyncLoading();

    /// Setting state and accessing data through AsyncValue (Riverpod Special Format)
    /// So UI can preview error dialogs, and we can catch potential errors without repetitive try-catch-finally blocks
    state = await AsyncValue.guard(() async {
      return await _wishlistManager.getWishlistProducts(
          userModel: ref.watch(userProvider).value!);
    });
  }

  addProductToWishlist({required Product product}) async {
    debugPrint('WishlistNotifier | addProductToWishlist() Executed');

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await _wishlistManager.addProductToWishlist(
          productId: product.id,
          userModel: ref.watch(userProvider).value!,
        );

        return [...previousState, product];
      },
    );
  }
```

App wide globals handled elegantly under Utility classes:

 *** All text styles and color palette (both light and dark mode colors) implemented to Flutter's theming system, and used in the project accordingly

 *** All the padding, spacing, radius and layout dimensions can be controlled in a single central place dynamically

 *** Language Internationalization's NOT implemented (not a big fan of code generation actually). But we can easily add a new language just by extending an abstract class, since app wide constant strings are derived from it.

![Alternate Text](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/50fps360low.gif)

(Videos/Gifs to-be-updated soon, dont mind the placeholders)

## To-Be-New-Section
![alt-text](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/50fps480low.gif)

(Videos/Gifs to-be-updated soon, dont mind the placeholders)

## To-Be-New-Section

# E-Commerce Project
### **Premium Women Fashion Shopping App**  (with Flutter, Riverpod, Firebase, Hive and Stripe)

![Alternate Text](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/4ktest.gif)

> Developed a fully functional e-commerce application from scratch, showcasing 100+ visually appealing fashion products

![](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/50fps360high.gif)

> Delivered core features, including wishlist, shopping cart, searching, advanced filtering and sorting, exploring latest trends, dynamic product collections, product reviews and ratings, order tracking capabilities and more, to provide an immersive shopping experience


## E-Commerce Project : Premium Women Fashion Shopping App
Complete ECommerce Fashion Shopping Project with Flutter, Riverpod, Firebase, Hive and Stripe

Developed a fully functional e-commerce application from scratch using Flutter, showcasing 100+ visually appealing fashion products 

![](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/50fps360high.gif)

(Videos/Gifs to-be-updated soon)

