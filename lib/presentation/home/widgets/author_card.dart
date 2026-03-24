import 'package:authors/authors_ui_foundations.dart';
import 'package:authors/presentation/home/view_models.dart';
import 'package:flutter/material.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({super.key, required this.author});

  final AuthorViewModel author;

  @override
  Widget build(BuildContext context) {
    final colorTheme = AuthorsColorTheme.of(context);
    final textTheme = AuthorsTextTheme.of(context);

    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: colorTheme.backgroundSecondary,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Text(
                    author.name,
                    style: textTheme.body1Medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (author.birthDate.isNotEmpty)
                  Text('${author.birthDate} - ${author.deathDate}'),
              ],
            ),
            Text(
              '${author.workCount} books, top work - ${author.topWork}, alternate names - "${author.alternateNames?.join(', ')}", top subjects - "${author.topSubjects?.join(', ')}"',
              style: textTheme.body2Regular,
            ),
          ],
        ),
      ),
    );
  }
}
