# ECommerse Shopping Project
Complete ECommerce Fashion Shopping Project with Flutter, Riverpod, Firebase, Hive and Stripe

![](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/50fps360high.gif)

(Videos/Gifs to-be-updated soon, dont mind the placeholders)

## Project Structure
```bash
├── lib                                                                                                                              
│   ├── *models
│   │   └── user_model.dart                                                                                                        
│   │   └── post_model.dart                                                                                                             
│   │   └── comment_model.dart
│   │   └── profile_model.dart                                                                                                        
│   └── *services                 
│   │   └── navigation_service.dart
│   │   └── locator_service.dart 
│   │   └── auth_service.dart
│   │   └── log_service.dart
│   │   └── database_service.dart
│   │   └── local_storage_service.dart
│   │   └── *abstract_classes 
│   │       └── i_auth_service, ...                                                                                                         
│   └── *viewmodels                                                                                                                           
│   │   └── home_viewmodel.dart
│   │   └── profile_viewmodel.dart                                                                                                      
│   │   └── blocs/cubits 
│   │   └── page_bloc.dart
│   │       └── page_bloc_state_events.dart                                                                                          
│   └── *ui                                                                                                                                    
│   │   └── *pages
│   │       └── home_page.dart
│   │       └── profile_page.dart
│   │       └── message_page.dart                                                                                                         
│   │   └── *components.                                                                                                                    
│   │       └── appbar_widget.dart
│   │       └── navigation_bar_widget.dart                                                                                                        
│   │       └── popup_widget.dart                                                                                                        
│   │       └── listview_builder_widget.dart
│   └── *utilities
│   │   └── constants.dart                                                                                                        
│   │   └── themes.dart
│   └── *assets
│   │   └── images/icons/svgs/fonts/...                                                                                                          
│   ├── app.dart                                                                                                        
│   └── main.dart                                                                                                        
├── pubspec.yaml
├── gitignore
├── dockerfile
├── dockercomposefile
```
Designed as Multi-Layered Architecture in Monolith Pattern, with strict “Separation of Concerns” logic between layers.

Every service and manager class have derived from a separate abstract class/interface, to reduce layer dependencies to the absolute minimum. Therefore, changing an external source/package in the project can be easily managed by just switching Dependency Injection Service's (get_it) target abstract-concrete class selection, within seconds.

## &nbsp;Tech Stack

<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/flutter/flutter-original.svg" alt="Flutter" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/dart/dart-original.svg" alt="Dart" width="50" height="50"/> &nbsp;
<img  src="https://raw.githubusercontent.com/devicons/devicon/master/icons/firebase/firebase-original-wordmark.svg" alt="Firebase" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/master/icons/algolia/algolia-original.svg" alt="Algolia" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/vscode/vscode-original.svg" alt="VSCode" width="50" height="50"/> &nbsp;<img  src="https://github.com/CyrisXD/CyrisXD/raw/master/assets/Github.png" alt="GitHub" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/gitlab/gitlab-original-wordmark.svg" alt="GitLab" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/bitbucket/bitbucket-original-wordmark.svg" alt="BitBucket" width="50" height="50"/> &nbsp;

## Dependencies on pubspec.yaml
```yaml
#############################################################################################################

  flutter_riverpod: ^2.5.1                # State Management Solution
  get_it: ^7.7.0                          # Dependency Injection Service
  go_router: ^14.2.2                      # Advanced Navigation & Routing System
  flutter_screenutil: ^5.9.3              # Responsive & Adaptive Design

  firebase_core: ^3.3.0                   # Firebase Services
  firebase_auth: ^5.1.4                   # Firebase Authentication Service
  google_sign_in: ^6.2.1                  # Google Authentication Service
  cloud_firestore: ^5.2.1                 # Firebase Cloud Database Service
  firebase_storage: ^12.1.3               # Firebase Cloud Storage Service

  uuid: ^4.4.2                            # Random ID Generator
  intl: ^0.19.0                           # Date-Time Formatter
  faker_dart: ^0.2.2                      # Random Fake Data Generator
  card_swiper: ^3.0.1                     # Carousel Image Slider
  smooth_page_indicator: ^1.2.0           # Image Slider Pagination
  flutter_animate: ^4.5.0                 # Advanced Animation Builder
  flutter_slidable: ^3.1.1                # Advanced Version of Flutter Dismissible Widget
  zoom_pinch_overlay: ^1.4.3              # Advanced Version of Flutter Interactive Widget
  ...

#############################################################################################################
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
