import 'package:flutter/material.dart';
import '../../../../../domain/entity/model/user/portfolio_skills_model.dart';
import 'tree_node.dart';
import 'tree_root.dart';

class TreeView extends StatelessWidget {
  final List<PortfolioSkillsModel> data;

  final double offsetLeft;

  final TextStyle subCategoryTextStyle;
  final TextStyle categoryTextStyle;

  const TreeView({
    Key? key,
    required this.data,
    this.offsetLeft = 24.0,
    required this.subCategoryTextStyle,
    required this.categoryTextStyle,
  }) : super(key: key);

  List<TreeNode> _geneTreeNodes(List list) {
    List treeNodes = <TreeNode>[];

    for (int i = 0; i < list.length; i++) {
      final PortfolioSkillsModel item = list[i];
      final title = Text(
        item.title,
        style: subCategoryTextStyle,
        softWrap: true,
      );
      final expaned = item.expanded ;
      final children = item.children;

      treeNodes.add(TreeNode(
        title: title,
        expanded: expaned,
        offsetLeft: offsetLeft,
        children: _geneTreeNodes(children),
      ));
    }

    return treeNodes as List<TreeNode>;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(data.length, (int index) {
        final PortfolioSkillsModel item = data[index];
        final title = Text(
          item.title,
          style: categoryTextStyle,
        );

        final expaned = item.expanded;
        final children = item.children;

        return TreeRoot(
          title: title,
          expanded: expaned,
          offsetLeft: offsetLeft,
          children: _geneTreeNodes(children),
        );
      }),
    );
  }
}
