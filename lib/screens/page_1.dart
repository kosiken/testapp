import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/gen/assets.gen.dart';
import 'package:testapp/mock/data.dart';
import 'package:testapp/models/option.dart';
import 'package:testapp/models/user_question.dart';
import 'package:testapp/widgets/icon_button.dart';
import 'package:testapp/widgets/typography.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final userQuestionProvider = NotifierProvider<UserOptions, UserQuestion>(UserOptions.new);


class _DescriptiveIcon extends StatelessWidget {
  final String assetName;
  final String title;
  final Color color;
  const _DescriptiveIcon(
      {super.key,
      required this.assetName,
      required this.title,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          assetName,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
        const SizedBox(
          width: 2,
        ),
        AppTypography(
          title,
          color: color,
          variant: TypographyVatiant.small,
        )
      ],
    );
  }
}



class _OptionWidget extends StatelessWidget {
  final Option option;
  final bool selected;
  final VoidCallback onTap;
  const _OptionWidget(
      {required this.option, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF232A2E),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? const Color(0xFF8B88EF)
                  : Colors.transparent, // Colors.brown,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        selected ? const Color(0xFF8B88EF) : Colors.transparent,
                    border: Border.all(
                        color: selected
                            ? const Color(0xFF8B88EF)
                            : const Color(0xFFC4C4C4),
                        width: 1 // Colors.brown,
                        )),
                width: 20,
                height: 20,
                margin: const EdgeInsets.only(right: 10),
                child: Center(
                  child: AppTypography(
                    option.label,
                    color: Colors.white,
                    variant: TypographyVatiant.small,
                  ),
                ),
              ),
              Expanded(
                  child: AppTypography(
                option.text,
                fontSize: 14,
                color: const Color(0xFFC4C4C4),
                height: 1,
              ))
            ],
          ),
        ));
  }
}

List<Option> options = [
  Option(label: 'A', text: 'The peace in the early mornings'),
  Option(label: 'B', text: 'The magical golden hours'),
  Option(label: 'C', text: 'Wind-down time after dinners'),
  Option(label: 'D', text: 'The serenity past midnight'),
];

class Page1 extends HookConsumerWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userQuestionRef = ref.watch(userQuestionProvider);
    var selectedOption = useState('D');
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
            child: Stack(
          children: [
            Assets.images.chaletSunset.image(
              height: size.height * 0.57,
              width: size.width,
              fit: BoxFit.cover,
            ),
            Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0x000F1115),
                      Color(0x470D0E12),
                      Color(0xA30B0C0F),
                      Color(0xCC090B0D),
                      Color(0xFF000000)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.44, 0.48, 0.53, 0.54, 0.58]),
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0x66000000),
                      Color(0x1F000000),
                      Color(0x00000000)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.13, 0.23]),
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                    center: Alignment(0.75, 0.34),
                    focal: Alignment(0.50, 0.18),
                    stops: [
                      0,
                      0.63,
                      0.75,
                      0.88,
                      1
                    ],
                    colors: [
                      Color(0x0B000000),
                      Color(0x1B000000),
                      Color(0x22000000),
                      Color(0x32000000),
                      Color(0x3D000000)
                    ]),
              ),
            ),
            SafeArea(
              bottom: false,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const AppTypography("Stroll Bonfire",
                                  variant: TypographyVatiant.header,
                                  fontSize: 34,
                                  color: Color(0xFFCCC8FF)),
                              const SizedBox(
                                width: 4,
                              ),
                              Assets.icons.arrowDown.svg()
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _DescriptiveIcon(
                                assetName: Assets.icons.stopClock.path,
                                title: '22h 00m',
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                             _DescriptiveIcon(
                                assetName: Assets.icons.person.path,
                                title: '103',
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              foregroundImage:
                                 Assets.images.joey.provider(),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                             Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const AppTypography('Angelina, 28',
                                      variant: TypographyVatiant.small,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFF5F5F5)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: AppTypography(
                                      userQuestionRef.question,
                                      color: const Color(0xFFF5F5F5),
                                      variant: TypographyVatiant.header,
                                      height: 1,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTypography(
                        '“${userQuestionRef.userHint}”',
                        italics: true,
                        variant: TypographyVatiant.small,
                        color: const Color(0xB2CBC9FF),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: (60 * (userQuestionRef.options.length / 2)) + 20,
                        child: GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 58,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 15),
                          physics: const NeverScrollableScrollPhysics(),
                          children:  userQuestionRef.options
                              .map((option) => _OptionWidget(
                                    option: option,
                                    onTap: () {
                                      selectedOption.value = option.label;
                                    },
                                    selected:
                                        option.label == selectedOption.value,
                                  ))
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                       Row(
                        children: [
                          const Expanded(
                            child: AppTypography(
                              "Pick your option.\nSee who has a similar mind.",
                              color: Color(0xFFE5E5E5),
                              variant: TypographyVatiant.small,
                            ),
                          ),
                          AppIconButton(
                            assetName: Assets.icons.microphone.path,
                            variant: AppIconButtonVariant.outline,
                            color: const Color(0xFF8B88EF),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const AppIconButton(
                            icon: Icons.arrow_forward,
                            variant: AppIconButtonVariant.filled,
                            color: Color(0xFF8B88EF),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ],
        )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 100,
          color: const Color(0xFF0F1115),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIconButton(
                  assetName: Assets.icons.loveCards.path,
                  variant: AppIconButtonVariant.iconOnly,
                  color: Colors.white,
                  size: 28,
                ),
                AppIconButton(
                  assetName: Assets.icons.flame.path,
                  showBadge: true,
                  variant: AppIconButtonVariant.iconOnly,
                  color: Colors.white,
                  size: 28,
                ),
                AppIconButton(
                  assetName: Assets.icons.chat.path,
                  showBadge: true,
                  badgeCount: 10,
                  variant: AppIconButtonVariant.iconOnly,
                  color: Colors.white,
                  size: 28,
                ),
                AppIconButton(
                  assetName: Assets.icons.person.path,
                  variant: AppIconButtonVariant.iconOnly,
                  color: Colors.white,
                  size: 28,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
