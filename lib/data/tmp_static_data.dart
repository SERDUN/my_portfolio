import 'package:my_portfolio/domain/entity/model/model_project.dart';
import 'package:my_portfolio/domain/entity/model/model_project_media.dart';

import '../domain/entity/model/model_project_description.dart';
import '../domain/entity/model/model_project_tags.dart';

class TmpStaticData {
  static List<ModelProject> getProjects() {
    List<ModelProject> projects = [];

    _addAlias(projects);
    _addMpet(projects);
    _addColumbus(projects);
    _addLune(projects);
    _addArrkass(projects);
    _addSlaywoke(projects);
    _addNightApp(projects);
    _addFoodie(projects);
    _addDaberli(projects);
    return projects;
  }

  static void _addAlias(List<ModelProject> projects) {
    ModelProjectMedia modelProjectMedia = ModelProjectMedia(
        screenshots: [
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/al/scr1.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/al/scr2.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/al/scr3.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/al/scr4.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/al/scr5.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/al/scr6.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/al/scr7.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/al/scr8.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/al/scr9.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/al/scr10.jpg",
        ],
        mainCover:
            'https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/al/scr10.jpg',
        typeCover: 'fitHeight');

    ModelProjectTags modelProjectTags = ModelProjectTags(
        projectTags: ["Game", "Cards", "Party"],
        developmentTags: ["Java", "RX", "Auth"]);

    ModelProjectDescription modelProjectDescription = ModelProjectDescription(
        fullDescription:
            'Alias or Charades - guess word board game is a new free version of the world-famous activity Alias board game. The objective of Alias is to explain words to team members. For each word thats correctly guessed by one of your teammates, your team gets a point. Our app lets you play Alias anywhere without a ton of paper cards and a board. Catch new features! Steelkiwi has released a web version of the Alias or Charades game where you can comfortably add your own word sets and use them on your phone. Now you could add set on any language. Play your own sets with your friends or share it to all word. Cool, isn’t it? Check it out here: https://getalias.co/ The best feature of free Alias is its themed sets of words. We’ve already prepared Space, Party and Food sets. We’re planning to make lots more soon. You can also play the standard Alias to set your difficulty level and play with a random set of words. A separate Alias game mode for kids with pictures alongside words is also available in this version. Alias is an awesome game for both small and large groups. Having a party or a picnic? Don’t know what to do with your family on a rainy day? You could play Alias. It’s great for all ages. All you need is at least four people and the app.",',
        intro:
            'Alias or Charades - guess word board game is a new free version of the world-famous activity Alias board game. The objective of Alias is to explain words to team members.',
        shortDescription:
            'Alias or Charades - guess word board game is a new free version of the world-famous activity Alias board game. The objective of Alias is to explain words to team members. For each word thats correctly guessed by one of your teammates, your team gets a point.');

    ModelProject modelProject = ModelProject(
        media: modelProjectMedia,
        tags: modelProjectTags,
        description: modelProjectDescription,
        name: 'Alias');
    projects.add(modelProject);
  }

  static void _addFoodie(List<ModelProject> projects) {
    ModelProjectMedia modelProjectMedia = ModelProjectMedia(
        screenshots: [
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ff/scr1.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ff/scr2.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ff/scr3.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ff/scr4.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ff/scr5.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ff/scr6.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ff/scr7.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ff/scr8.jpg",
        ],
        mainCover:
            'https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ff/scr9.png',
        typeCover: 'fitHeight');

    ModelProjectTags modelProjectTags = ModelProjectTags(
        projectTags: ["Game", "Cards", "Party"],
        developmentTags: ["Java", "RX", "Auth"]);

    ModelProjectDescription modelProjectDescription = ModelProjectDescription(
        fullDescription:
            'Alias or Charades - guess word board game is a new free version of the world-famous activity Alias board game. The objective of Alias is to explain words to team members. For each word thats correctly guessed by one of your teammates, your team gets a point. Our app lets you play Alias anywhere without a ton of paper cards and a board. Catch new features! Steelkiwi has released a web version of the Alias or Charades game where you can comfortably add your own word sets and use them on your phone. Now you could add set on any language. Play your own sets with your friends or share it to all word. Cool, isn’t it? Check it out here: https://getalias.co/ The best feature of free Alias is its themed sets of words. We’ve already prepared Space, Party and Food sets. We’re planning to make lots more soon. You can also play the standard Alias to set your difficulty level and play with a random set of words. A separate Alias game mode for kids with pictures alongside words is also available in this version. Alias is an awesome game for both small and large groups. Having a party or a picnic? Don’t know what to do with your family on a rainy day? You could play Alias. It’s great for all ages. All you need is at least four people and the app.",',
        intro:
            'Alias or Charades - guess word board game is a new free version of the world-famous activity Alias board game. The objective of Alias is to explain words to team members.',
        shortDescription:
            'Alias or Charades - guess word board game is a new free version of the world-famous activity Alias board game. The objective of Alias is to explain words to team members. For each word thats correctly guessed by one of your teammates, your team gets a point.');

    ModelProject modelProject = ModelProject(
        media: modelProjectMedia,
        tags: modelProjectTags,
        description: modelProjectDescription,
        name: 'Foodie(Client)');
    projects.add(modelProject);
  }

  static void _addMpet(List<ModelProject> projects) {
    ModelProjectMedia modelProjectMedia = ModelProjectMedia(
        screenshots: [
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/mp/scr1.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/mp/scr6.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/mp/scr2.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/mp/scr3.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/mp/scr4.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/mp/scr5.png",
        ],
        mainCover:
            'https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/mp/scr1.png',
        typeCover: "fitWidth");

    ModelProjectTags modelProjectTags = ModelProjectTags(
        projectTags: ["Heath", "Pets", "Dog"],
        developmentTags: ["Flutter", "BLoC", "Google Map"]);

    ModelProjectDescription modelProjectDescription = ModelProjectDescription(
        fullDescription:
            "Manage, store and transfer pet medical records and health information. Communicate with veterinarians and pet service providers through video, text and send pictures. Locate pet service providers using Google locator.",
        intro:
            'A mobile app to store and share pets medical and health data and find useful information about pet',
        shortDescription:
            "Manage, store and transfer pet medical records and health information. Communicate with veterinarians and pet service providers through video, text and send pictures. Locate pet service providers using Google locator.");

    ModelProject modelProject = ModelProject(
        media: modelProjectMedia,
        tags: modelProjectTags,
        description: modelProjectDescription,
        name: 'mPet');
    projects.add(modelProject);
  }

  static void _addColumbus(List<ModelProject> projects) {
    ModelProjectMedia modelProjectMedia = ModelProjectMedia(
        screenshots: [
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/cl/scr1.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/cl/scr2.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/cl/scr3.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/cl/scr4.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/cl/scr5.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/cl/scr6.png",
        ],
        mainCover:
            'https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/cl/scr7.png',
        typeCover: "fitWidth");

    ModelProjectTags modelProjectTags = ModelProjectTags(projectTags: [
      "Restaurants menu",
      "Asia and Pacific",
      "Retail and food tech",
      "Loyalty app"
    ], developmentTags: [
      "Android",
      "Navigator",
      "Google Map"
    ]);

    ModelProjectDescription modelProjectDescription = ModelProjectDescription(
        fullDescription:
            "The story of Columbus Coffee began in 1994 when four coffee aficionados including David Burton got an idea for a cafe that would share the best coffee traditions from around the world. After much planning, they opened their first coffee spot in Auckland CBD. Today, Columbus Coffee is a premium fast-casual franchise that has over 60 cafes across the North and South Islands of New Zealand. ",
        intro:
            'A loyalty app that allows Columbus Coffee customers to earn points and find nearby locations',
        shortDescription:
            "The story of Columbus Coffee began in 1994 when four coffee aficionados including David Burton got an idea for a cafe that would share the best coffee traditions from around the world. After much planning, they opened their first coffee spot in Auckland CBD. Today, Columbus Coffee is a premium fast-casual franchise that has over 60 cafes across the North and South Islands of New Zealand. ");

    ModelProject modelProject = ModelProject(
        media: modelProjectMedia,
        tags: modelProjectTags,
        description: modelProjectDescription,
        name: 'Columbus Coffee Rewards');
    projects.add(modelProject);
  }

  static void _addLune(List<ModelProject> projects) {
    ModelProjectMedia modelProjectMedia = ModelProjectMedia(
        screenshots: [
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ln/scr1.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ln/scr2.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ln/scr3.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ln/scr4.png",
        ],
        mainCover:
            'https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ln/scr3.png',
        typeCover: "fitWidth");

    ModelProjectTags modelProjectTags = ModelProjectTags(projectTags: [
      "Restaurants menu",
      "Asia and Pacific",
      "Retail and food tech",
      "Loyalty app"
    ], developmentTags: [
      "Android",
      "Navigator",
      "Google Map"
    ]);

    ModelProjectDescription modelProjectDescription = ModelProjectDescription(
        shortDescription:
            "We used the BLoC clean architecture design concept for the user interface (UI). This enabled us to separate layers and not tie components together too much. It also allows us to change the app’s logic with minimal changes to UI components. Modularity offers the benefit of being able to change components without influencing other components and to add dependencies when required.",
        intro:
            'A mobile application that allows users to save money, share money, and take control of their finance',
        fullDescription:
            "We created a cross-platform app written in Flutter. However, Dapi doesn’t operate with cross-platform apps, so we had to write plugins for each operating system. We used Swift to create a plugin for iOS and Kotlin to create a plugin for Android.To speed up the processing of operations such as financial transactions, Lune supports partial data caching.We used the BLoC clean architecture design concept for the user interface (UI). This enabled us to separate layers and not tie components together too much. It also allows us to change the app’s logic with minimal changes to UI components. Modularity offers the benefit of being able to change components without influencing other components and to add dependencies when required.We worked on the basis of Modular Library, which provides the following features: Automatic memory managementDependency injectionDynamic routingCode modularizationPayment service integrationsTo implement a payment gateway, we used official plugins by the flutter.dev team. However, these official plugins don’t support changing subscription plans. So, we needed to use additional plugins supporting this functionality created by an independent team.The official iOS plugin can’t change subscriptions, so we had to change the UI so users understand they need to cancel their previous subscription before upgrading or downgrading.");
    ModelProject modelProject = ModelProject(
        media: modelProjectMedia,
        tags: modelProjectTags,
        description: modelProjectDescription,
        name: 'Lune');
    projects.add(modelProject);
  }

  static void _addArrkass(List<ModelProject> projects) {
    ModelProjectMedia modelProjectMedia = ModelProjectMedia(
        screenshots: [
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ar/scr1.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ar/scr6.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ar/scr2.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ar/scr3.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ar/scr4.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ar/scr5.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ar/scr6.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ar/scr7.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ar/scr8.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ar/scr9.png",
        ],
        mainCover:
            'https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ar/scr1.png',
        typeCover: "fitWidth");

    ModelProjectTags modelProjectTags = ModelProjectTags(
        projectTags: ["Middle East and Africa", "Finance", "Dog"],
        developmentTags: ["Flutter", "BLoC", "Google Map"]);

    ModelProjectDescription modelProjectDescription = ModelProjectDescription(
        fullDescription:
            "Arrkas is a Saudi startup looking to solve problems in the Saudi coupon market. The idea behind Arrkas is to connect buyers and sellers in one app. Buyers can access dozens of paperless coupons and receive rewards for transactions, whereas sellers can sell coupons to customers. ",
        intro:
            'A mobile app for buying and selling paperless coupons that caters to Saudi retailers and consumers',
        shortDescription:
            "Arrkas is a Saudi startup looking to solve problems in the Saudi coupon market. The idea behind Arrkas is to connect buyers and sellers in one app. Buyers can access dozens of paperless coupons and receive rewards for transactions, whereas sellers can sell coupons to customers. ");
    ModelProject modelProject = ModelProject(
        media: modelProjectMedia,
        tags: modelProjectTags,
        description: modelProjectDescription,
        name: 'Arrkas');
    projects.add(modelProject);
  }

  static void _addSlaywoke(List<ModelProject> projects) {
    ModelProjectMedia modelProjectMedia = ModelProjectMedia(
        screenshots: [
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/sl/scr1.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/sl/scr6.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/sl/scr2.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/sl/scr3.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/sl/scr4.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/sl/scr5.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/sl/scr6.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/sl/scr7.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/sl/scr8.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/sl/scr9.jpg",
        ],
        mainCover:
            'https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/sl/scr9.jpg',
        typeCover: "fitWidth");

    ModelProjectTags modelProjectTags = ModelProjectTags(
        projectTags: ["Northern America", "Social", "Live chat"],
        developmentTags: ["Flutter", "BLoC", "Google Map"]);

    ModelProjectDescription modelProjectDescription = ModelProjectDescription(
        fullDescription:
            "To get the Slaywoke MVP out the door fast, we suggested using the cross-platform Flutter framework. It allowed us to save time on app development since we could write code once and run it on both Android and iOS. This allowed Eric to test his idea on both Android and iPhone users. We needed to display nearby users on a dynamic map with a radar overlay. Google Maps seemed like the perfect option, but at the time Flutter didn’t offer full support for Google Maps, meaning we couldn’t change the color scheme and customize markers. We decided to work around this by building these features from scratch. Today, Flutter already offers full support for Google Maps, so this is no longer a concern for new apps.",
        intro:
            'A location-based social network for meeting new people at schools and universities',
        shortDescription:
            "The main purpose of Slaywoke is to show nearby users and display posts by them. To get started with Slaywoke, you have to sign up for an account, create a profile, upload a photo, and set your location. Once registered, you can view the profiles of other users who are within 3,000 feet (a little under a kilometer), add them as friends, chat with them, and arrange a meeting offline.");
    ModelProject modelProject = ModelProject(
        media: modelProjectMedia,
        tags: modelProjectTags,
        description: modelProjectDescription,
        name: 'Slaywoke');
    projects.add(modelProject);
  }

  static void _addNightApp(List<ModelProject> projects) {
    ModelProjectMedia modelProjectMedia = ModelProjectMedia(
        screenshots: [
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ng/scr1.jpg",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ng/scr2.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ng/scr3.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ng/scr4.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ng/scr5.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ng/scr6.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ng/scr7.png",
        ],
        mainCover:
            "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/ng/scr1.jpg",
        typeCover: "cover");

    ModelProjectTags modelProjectTags = ModelProjectTags(
        projectTags: ["Northern America", "Social", "Live chat"],
        developmentTags: ["Flutter", "BLoC", "Google Map"]);

    ModelProjectDescription modelProjectDescription = ModelProjectDescription(
        fullDescription:
            "We built the Android app using the MVP design pattern, which allowed us to split the business logic from the UI perfectly. To write the app, we chose Kotlin. Kotlin helped us reduce the amount of code compared to Java, and we were able to get the same result in less time.We used the RxKotlin framework built on the basis of the Paternal Observer pattern. RxKotlin gave us the possibility to subscribe to events and work more conveniently with the background streams that are most actively used when requesting a server with the help of the Retrofit framework. To implement all of our client’s ideas, we chose Google Maps because they allowed us to customize the marker that helps users see how busy a certain place is.As the app features photos of different places, we used the Glide library to cache photos.The Dexter libraries were excellent for permission queries and added more convenience. With Dexter, it's easy to ask users for permission to record data to the phone's memory or access the camera or geolocation features.",
        intro:
            'A heatmap that shows live attendance at bars, nightclubs, restaurants, and karaoke',
        shortDescription:
            "We built the Android app using the MVP design pattern, which allowed us to split the business logic from the UI perfectly. To write the app, we chose Kotlin. Kotlin helped us reduce the amount of code compared to Java, and we were able to get the same result in less time.");
    ModelProject modelProject = ModelProject(
        media: modelProjectMedia,
        tags: modelProjectTags,
        description: modelProjectDescription,
        name: 'NightApp');
    projects.add(modelProject);
  }

  static void _addDaberli(List<ModelProject> projects) {
    ModelProjectMedia modelProjectMedia = ModelProjectMedia(
        screenshots: [
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/db/scr1.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/db/scr6.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/db/scr2.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/db/scr3.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/db/scr4.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/db/scr5.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/db/scr6.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/db/scr7.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/db/scr8.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/db/scr9.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/db/scr10.png",
          "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/db/scr11.png",
        ],
        mainCover:
            'https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/db/scr1.png',
        typeCover: "fitWidth");

    ModelProjectTags modelProjectTags = ModelProjectTags(
        projectTags: ["Heath", "Pets", "Dog"],
        developmentTags: ["Flutter", "BLoC", "Google Map"]);

    ModelProjectDescription modelProjectDescription = ModelProjectDescription(
        fullDescription:
            "Manage, store and transfer pet medical records and health information. Communicate with veterinarians and pet service providers through video, text and send pictures. Locate pet service providers using Google locator.",
        intro:
            'A mobile app to store and share pets medical and health data and find useful information about pet',
        shortDescription:
            "Manage, store and transfer pet medical records and health information. Communicate with veterinarians and pet service providers through video, text and send pictures. Locate pet service providers using Google locator.");

    ModelProject modelProject = ModelProject(
        media: modelProjectMedia,
        tags: modelProjectTags,
        description: modelProjectDescription,
        name: 'mPet');
    projects.add(modelProject);
  }
}
