import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/domain/summary/export_summary.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({
    Key? key = const ValueKey('playing'),
    required this.audioPlayerState,
    this.leadingBar,
    this.onClosePressed,
    this.onSeekChanged,
    this.onNextPressed,
    this.onBackPressed,
    this.onPlayPressed,
  }) : super(key: key);

  final Widget? leadingBar;
  final Stream<AudioPlayerState> audioPlayerState;
  final VoidCallback? onClosePressed;
  final ValueChanged<Duration>? onSeekChanged;
  final VoidCallback? onNextPressed;
  final VoidCallback? onBackPressed;
  final VoidCallback? onPlayPressed;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AudioPlayerState>(
      key: key,
      stream: audioPlayerState,
      builder: (context, snapshot) {
        final audioPlayerState = snapshot.data;
        final progress = audioPlayerState?.position ?? Duration.zero;
        final buffered = audioPlayerState?.bufferPosition ?? Duration.zero;
        final total = audioPlayerState?.duration ?? Duration.zero;

        return Padding(
          padding: EdgeInsets.only(
            left: AppDimens.size10,
            right: AppDimens.size10,
            top: onClosePressed != null ? AppDimens.size10 : AppDimens.size30,
          ),
          child: Column(
            children: [
              if (onClosePressed != null)
                InkWell(
                  onTap: onClosePressed,
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.close),
                  ),
                ),
              const SizedBox(height: AppDimens.size10),
              Flexible(
                child: Row(
                  children: [
                    if (leadingBar != null)
                      Padding(
                        padding: const EdgeInsets.only(right: AppDimens.size20),
                        child: leadingBar!,
                      ),
                    Expanded(
                      child: ProgressBar(
                        progress: progress,
                        buffered: buffered,
                        total: total,
                        onSeek: onSeekChanged,
                        baseBarColor: AppColors.primary.withOpacity(0.1),
                        thumbColor: AppColors.primary,
                        bufferedBarColor: AppColors.primary.withOpacity(0.2),
                        progressBarColor: AppColors.primary.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: onBackPressed,
                      child: const SizedBox(
                        width: 35,
                        height: 35,
                        child: Icon(
                          Icons.skip_previous,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppDimens.size10),
                      child: BounceWrapper(
                        onPressed: onPlayPressed,
                        child: CircularContainer(
                          size: 50,
                          color: audioPlayerState?.isPlaying == null ? AppColors.lightGrey100 : AppColors.primary,
                          duration: duration,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            transitionBuilder: (Widget child, Animation<double> animation) {
                              return FadeTransition(opacity: animation, child: child);
                            },
                            child: audioPlayerState?.isPlaying == null
                                ? const Icon(
                                    Icons.play_arrow,
                                    size: AppDimens.size30,
                                    color: AppColors.black,
                                  )
                                : Icon(
                                    audioPlayerState!.isPlaying ? Icons.pause : Icons.play_arrow,
                                    size: AppDimens.size30,
                                    color: AppColors.white,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onNextPressed,
                      child: const SizedBox(
                        width: 35,
                        height: 35,
                        child: Icon(
                          Icons.skip_next,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Duration get duration => const Duration(milliseconds: 300);
}
