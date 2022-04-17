import '../../../../domain/entity/model/user/portfolio_user_model.dart';

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
