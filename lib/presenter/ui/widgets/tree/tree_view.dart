import 'package:flutter/material.dart';
import 'package:my_portfolio/config/typography.dart';
import 'package:my_portfolio/presenter/ui/widgets/tree/tree_root.dart';

import 'tree_node.dart';

class TreeView extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  final String titleKey;
  final String leadingKey;
  final String expanedKey;
  final String childrenKey;
  final double offsetLeft;

  final Function? titleOnTap;
  final Function? leadingOnTap;
  final Function? trailingOnTap;

  final TextStyle textStyle;

  const TreeView({
    required this.data,
    this.titleKey = 'title',
    this.leadingKey = 'leading',
    this.expanedKey = 'expaned',
    this.childrenKey = 'children',
    this.offsetLeft = 24.0,
    required this.textStyle,
    this.titleOnTap,
    this.leadingOnTap,
    this.trailingOnTap,
  });

  List<TreeNode> _geneTreeNodes(List list) {
    List treeNodes = <TreeNode>[];

    for (int i = 0; i < list.length; i++) {
      final Map<String, dynamic> item = list[i];
      final title = item[titleKey] == null ? null : Text(item[titleKey],style:textStyle ,);
      final leading = item[leadingKey] == null ? null : Text(item[leadingKey]);
      final expaned = item[expanedKey] ?? false;
      final children = item[childrenKey] as List;

      treeNodes.add(TreeNode(
        title: title,
        leading: leading,
        expanded: expaned,
        offsetLeft: offsetLeft,
        titleOnTap: titleOnTap,
        leadingOnTap: leadingOnTap,
        trailingOnTap: trailingOnTap,
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
        final Map<String, dynamic> item = data[index];
        final title = item[titleKey] == null
            ? null
            : Text(
                item[titleKey],
                style: subtitleBoldTextStyle,
              );
        final leading =
            item[leadingKey] == null ? null : Text(item[leadingKey]);
        final expaned = item[expanedKey] ?? false;
        final children = item[childrenKey] as List;

        return TreeRoot(
          title: title,
          leading: leading,
          expanded: expaned,
          offsetLeft: offsetLeft,
          titleOnTap: titleOnTap,
          leadingOnTap: leadingOnTap,
          trailingOnTap: trailingOnTap,
          children: _geneTreeNodes(children),
        );
      }),
    );
  }
}
