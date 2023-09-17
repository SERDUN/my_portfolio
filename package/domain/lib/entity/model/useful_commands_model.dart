class UsefulCommandsModel {
  UsefulCommandsModel(
    this.title,
    this.commands,
  );

  final String title;

  final List<UsefulCommandModel> commands;
}

class UsefulCommandModel {
  UsefulCommandModel(
    this.title,
    this.command,
  );

  final String title;
  final String command;
}
