import 'package:flutter/material.dart';
import 'package:stats_repository/stats_repository.dart';
import 'package:transformx/home/pages/stats_page/widgets/widgets.dart';

class StatsLoadedView extends StatefulWidget {
  const StatsLoadedView({required this.statistics, super.key});

  final List<Statistics> statistics;

  @override
  State<StatsLoadedView> createState() => _StatsLoadedViewState();
}

class _StatsLoadedViewState extends State<StatsLoadedView> {
  final PageController _controller = PageController();
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handlePageChange);
  }

  void _handlePageChange() {
    final currentPage = _controller.page!.toInt();
    setState(() {
      pageIndex = currentPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 0.6,
            child: PageView(
              controller: _controller,
              children: widget.statistics
                  .map((el) => StatsContainer(statistics: el))
                  .toList(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (pageIndex > 0) {
                      pageIndex--;
                    }
                  });
                  _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                icon: const Icon(
                  Icons.chevron_left_rounded,
                  size: 38,
                ),
              ),
              Expanded(
                child: Text(
                  widget.statistics.elementAt(pageIndex).habitName,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (pageIndex < widget.statistics.length - 1) {
                      pageIndex++;
                    }
                  });
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                icon: const Icon(
                  Icons.chevron_right_rounded,
                  size: 38,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
