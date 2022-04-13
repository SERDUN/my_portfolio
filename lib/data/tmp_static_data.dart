import 'package:my_portfolio/domain/entity/model/model_project.dart';
import 'package:my_portfolio/domain/entity/model/model_project_media.dart';

import '../domain/entity/model/model_project_description.dart';
import '../domain/entity/model/model_project_tags.dart';

class TmpStaticData {
  static List<ModelProject> getProjects() {
    List<ModelProject> projects = [];

    _addAlias(projects);
    _addMpet(projects);
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
}
