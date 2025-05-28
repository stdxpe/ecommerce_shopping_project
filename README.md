# ECommerce Shopping Project
## E-Commerce Project : Premium Women Fashion Shopping App
Complete ECommerce Fashion Shopping Project with Flutter, Riverpod, Firebase, Hive and Stripe

![](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/50fps360high.gif)

(Videos/Gifs to-be-updated soon)

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
│   │   └── images/ icons/ svgs/ lotties/ fonts/ ...                                                                                                           
│   ├── app_configuration.dart
│   ├── firebase_options.dart                                                                                                            
│   └── main.dart                                                                                                        
├── pubspec.yaml
├── gitignore
├── ENV_VAR
```

> E-Commerce Project : Premium Women Fashion Shopping App
* Developed a fully functional e-commerce application from scratch using Flutter, showcasing 100+ visually appealing fashion products 
* Integrated **Stripe API** for the secure payment processing, ensuring seamless checkout flows with reliable and real-time transactions
* Delivered core features, including wishlist, shopping cart, searching, advanced filtering and sorting, exploring latest trends, dynamic product collections, product reviews and ratings, order tracking capabilities and more, to provide an immersive shopping experience 
* Utilized **Riverpod** for State Management, get_it for Dependency Injection, and GoRouter for advanced Navigation/Routing service 
* Created a custom multi-layered architecture to ensure scalability, separation of concerns, minimum dependency, and loose coupling 
* Designed a modern, responsive UI with ScreenUtil and Figma, customized color palettes, dynamic theming, and Lottie animations 
* Enabled Google Sign-In and Firebase Auth for real-time user authentication and smooth onboarding experience 
* Implemented Firestore and Firebase Storage for cloud database solution, and Hive for local device storage and caching mechanism 


Designed as Multi-Layered Architecture in Monolith Pattern, with strict “Separation of Concerns” logic between layers.

Every service and manager class have derived from a separate abstract class/interface, to reduce layer dependencies to the absolute minimum. Therefore, changing an external source/package in the project can be easily managed by just switching Dependency Injection Service's (get_it) target abstract-concrete class selection, within seconds.

## &nbsp;Tech Stack

<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/flutter/flutter-original.svg" alt="Flutter" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/dart/dart-original.svg" alt="Dart" width="50" height="50"/> &nbsp;
<img  src="https://raw.githubusercontent.com/devicons/devicon/master/icons/firebase/firebase-original-wordmark.svg" alt="Firebase" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/master/icons/algolia/algolia-original.svg" alt="Algolia" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/vscode/vscode-original.svg" alt="VSCode" width="50" height="50"/> &nbsp;<img  src="https://github.com/CyrisXD/CyrisXD/raw/master/assets/Github.png" alt="GitHub" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/gitlab/gitlab-original-wordmark.svg" alt="GitLab" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/bitbucket/bitbucket-original-wordmark.svg" alt="BitBucket" width="50" height="50"/> &nbsp;

## Dependencies on pubspec.yaml
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

Extra Note: Riverpod and get_it is alternative services to each other, in the terms of dependency injection and creating singleton objects when necessary. But using Riverpod-only and passing "ref" throughout the app and in/to all layers, is NOT sth I want particularly, which creates a huge dependency issue. Instead, I wanted Riverpod to be only responsible for updating UI. I tried to design in a way that we can change, even our State Management solution from Riverpod to Bloc with minimum effort, just by replacing Riverpod providers into Blocs/Cubits, and changing Consumers into BlocBuilders in the UI.

```php
namespace AR_Vuforia;
    public function getDailyKnowledge(): array
        return [
            Php::class,
            Javascript::class,
            Laravel::class,
            Vuejs::class,
                  devOps: ["AWS", "Docker🐳", "Route53", "Nginx"],
                  databases: ["mongo", "MySql", "sqlite"],
                  misc: ["Firebase", "Socket.IO", "selenium", "open-cv", "php", "SuiteApp"]
            mobileApp: {
            native: ["Android Development"]
```
App wide globals handled elegantly under Utility classes:

 *** All text styles and color palette (both light and dark mode colors) implemented to Flutter's theming system, and used in the project accordingly

 *** All the padding, spacing, radius and layout dimensions can be controlled in a single central place dynamically

 *** Language Internationalization's NOT implemented (not a big fan of code generation actually). But we can easily add a new language just by extending an abstract class, since app wide constant strings are derived from it.


## To-Be-New-Section
![Alternate Text](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/4ktest.gif)

(Videos/Gifs to-be-updated soon, dont mind the placeholders)
```
namespace AR_Vuforia;
    public function getDailyKnowledge():
```
![Alternate Text](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/50fps360low.gif)

(Videos/Gifs to-be-updated soon, dont mind the placeholders)

## To-Be-New-Section
```javascript
const anmol = {
    pronouns: "He" | "Him",
    code: ["Javascript", "Python", "Java", "PHP"],
    askMeAbout: ["web dev", "tech", "app dev", "photography"],
    technologies: {
        backEnd: {
            js: ["Node", "Fastify", "Express"],
        },
        mobileApp: {
            native: ["Android Development"]
        },
        devOps: ["AWS", "Docker🐳", "Route53", "Nginx"],
        databases: ["mongo", "MySql", "sqlite"],
        misc: ["Firebase", "Socket.IO", "selenium", "open-cv", "php", "SuiteApp"]
    },
    architecture: ["Serverless Architecture", "Progressive web applications", "Single page applications"],
    currentFocus: "No Focus point at this time",
    funFact: "There are two ways to write error-free programs; only the third one works"
};
```

## To-Be-New-Section
![alt-text](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/50fps480low.gif)

(Videos/Gifs to-be-updated soon, dont mind the placeholders)

## To-Be-New-Section
