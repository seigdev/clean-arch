import 'package:cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Color(0xDD000000)),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }

        if (state is RemoteArticlesError) {
          return const Center(child: Icon(Icons.refresh));
        }

        if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('$index'),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
