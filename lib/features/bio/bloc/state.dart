import 'package:domain/domain.dart';

class InfoState {
  final PortfolioUserModel? userModel;

  InfoState({this.userModel});

  InfoState init() {
    return InfoState();
  }

  InfoState clone() {
    return InfoState();
  }

  InfoState fill(PortfolioUserModel userModel) {
    return InfoState(userModel: userModel);
  }


}
