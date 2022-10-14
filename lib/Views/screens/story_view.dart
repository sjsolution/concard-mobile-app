import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../../Controllers/OthersController/date_time.dart';
import 'package:concard/Controllers/storyController/story_controller.dart';
import '../../Models/Indiviuals/story_model.dart';

class StoryViewClass extends StatefulWidget {
  StoryViewClass({
    Key? key,
    required this.name,
    required this.profilePicture,
    required this.stories,
  }) : super(key: key);

  final String name;
  final String profilePicture;
  final List<Story> stories;

  @override
  State<StoryViewClass> createState() => _StoryViewClassState();
}

class _StoryViewClassState extends State<StoryViewClass>
    with SingleTickerProviderStateMixin {
  // final story.StoryController controller = story.StoryController();
  final StoryController storyController = StoryController();

  late PageController _pageController;
  late AnimationController _animController;
  late VideoPlayerController _videoController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this);

    final Story firstStory = widget.stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController.stop();
        _animController.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            print("loading story");
            _loadStory(story: widget.stories[_currentIndex]);
          } else if (_currentIndex > widget.stories.length) {
            print("should pop now");
            Navigator.pop(context);
          } else {
            // Out of bounds - loop story
            // You can also Navigator.of(context).pop() here
            // _currentIndex = 0;
            // _loadStory(story: widget.stories[_currentIndex]);
            Navigator.pop(context);
            print("should pop 2nd time");
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Story story = widget.stories[_currentIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.stories.length,
              itemBuilder: (context, i) {
                final Story story = widget.stories[i];
                print("this is story type");
                print(story.type);
                switch (story.type) {
                  case "file":
                    return Image.network(
                      story.image.toString(),
                      fit: BoxFit.cover,
                    );
                  case "text":
                    return Center(
                      child: Text(story.text.toString(),
                          style: TextStyle(color: Colors.white)),
                    );
                  case "video":
                    if (_videoController != null &&
                        _videoController.value.isInitialized) {
                      return FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoController.value.size.width,
                          height: _videoController.value.size.height,
                          child: VideoPlayer(_videoController),
                        ),
                      );
                    }
                }
                return const SizedBox.shrink();
              },
            ),
            Positioned(
              top: 40.0,
              left: 10.0,
              right: 10.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: widget.stories
                        .asMap()
                        .map((i, e) {
                          return MapEntry(
                            i,
                            AnimatedBar(
                              animController: _animController,
                              position: i,
                              currentIndex: _currentIndex,
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 1.5,
                      vertical: 10.0,
                    ),
                    child: UserInfo(
                        user: story,
                        name: widget.name,
                        profilePicture: widget.profilePicture),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < widget.stories.length) {
          _currentIndex += 1;
          _loadStory(story: widget.stories[_currentIndex]);
        } else {
          // Out of bounds - loop story
          // You can also Navigator.of(context).pop() here
          // _currentIndex = 0;
          // _loadStory(story: widget.stories[_currentIndex]);
          Navigator.pop(context);
        }
      });
    } else {
      if (story.image == "video") {
        if (_videoController.value.isPlaying) {
          _videoController.pause();
          _animController.stop();
        } else {
          _videoController.play();
          _animController.forward();
        }
      }
    }
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    _animController.stop();
    _animController.reset();
    switch (story.type) {
      case "file":
        _animController.duration = Duration(seconds: 5);
        _animController.forward();
        break;
      case "text":
        _animController.duration = Duration(seconds: 5);
        _animController.forward();
        setState(() {});
        break;
      case "video":
        // _videoController.value = null;
        _videoController.dispose();
        _videoController = VideoPlayerController.network(story.image.toString())
          ..initialize().then((_) {
            setState(() {});
            if (_videoController.value.isInitialized) {
              _animController.duration = _videoController.value.duration;
              _videoController.play();
              _animController.forward();
            }
          });
        break;
    }
    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    Key? key,
    required this.animController,
    required this.position,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildContainer(
                  double.infinity,
                  position < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animController,
                        builder: (context, child) {
                          return _buildContainer(
                            constraints.maxWidth * animController.value,
                            Colors.white,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final user;
  final profilePicture;
  final name;
  const UserInfo({
    Key? key,
    required this.user,
    required this.profilePicture,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[300],
          backgroundImage: NetworkImage(
            this.profilePicture,
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(
            this.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.close,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
