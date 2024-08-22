# ECommerse Shopping Project
Complete ECommerce Project with Flutter, Firebase Auth, Cloud Firestore, Firebase Storage and Hive

![](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/50fps360high.gif)

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

## &nbsp;Tech Stack

<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/flutter/flutter-original.svg" alt="Flutter" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/dart/dart-original.svg" alt="Dart" width="50" height="50"/> &nbsp;
<img  src="https://raw.githubusercontent.com/devicons/devicon/master/icons/firebase/firebase-original-wordmark.svg" alt="Firebase" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/master/icons/algolia/algolia-original.svg" alt="Algolia" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/vscode/vscode-original.svg" alt="VSCode" width="50" height="50"/> &nbsp;<img  src="https://github.com/CyrisXD/CyrisXD/raw/master/assets/Github.png" alt="GitHub" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/gitlab/gitlab-original-wordmark.svg" alt="GitLab" width="50" height="50"/> &nbsp;<img  src="https://raw.githubusercontent.com/devicons/devicon/1119b9f84c0290e0f0b38982099a2bd027a48bf1/icons/bitbucket/bitbucket-original-wordmark.svg" alt="BitBucket" width="50" height="50"/> &nbsp;

## pubspec.yaml
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


A little more about the code:  AKA Dependencies

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

## Google ARCore/Vuforia AR
![Alternate Text](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/4ktest.gif)
```
namespace AR_Vuforia;
    public function getDailyKnowledge():
```
![Alternate Text](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/50fps360low.gif)

## Unity (using C#)
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

## Flutter / Dart (Unity Project embedded in Flutter Project using third-party-widget-library)
![alt-text](https://github.com/stdxpe/Augmented-Reality-Project-Kinematic-Analysis-and-Programming-of-Industrial-Robotic-Arms/blob/main/50fps480low.gif)

## Solidworks / SketchUp (used for manipulating 3D Robot models)

&nbsp;
[![Twitter Follow](https://img.shields.io/twitter/follow/misteranmol?label=Follow)](https://twitter.com/intent/follow?screen_name=misteranmol)
[![Linkedin: anmol](https://img.shields.io/badge/-anmol-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/anmol-p-singh/)](https://www.linkedin.com/in/anmol098/)
![GitHub followers](https://img.shields.io/github/followers/anmol098?label=Follow&style=social)
[![website](https://img.shields.io/badge/Website-46a2f1.svg?&style=flat-square&logo=Google-Chrome&logoColor=white&link=https://anmolsingh.me/)](https://anmolsingh.me/)
![](https://visitor-badge.glitch.me/badge?page_id=anmol098.anmol098)
![Readme](https://github.com/anmol098/anmol098/workflows/Waka%20Readme/badge.svg)
