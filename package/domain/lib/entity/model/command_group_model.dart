class CommandGroupModel {
  CommandGroupModel(this.title, this.commands);

  final String title;

  final List<CommandModel> commands;
}

class CommandModel {
  CommandModel(this.title, this.command);

  final String title;
  final String command;
}
