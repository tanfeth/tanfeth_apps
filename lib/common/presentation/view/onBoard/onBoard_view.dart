import 'package:api_controller/model/on_board/onBoard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/view/onBoard/vm/onBoard_vm.dart';
import 'package:tanfeth_apps/common/presentation/view/onBoard/widget/item.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/welcome_route.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnBoardingView extends ConsumerStatefulWidget {
  const OnBoardingView({super.key});

  @override
  ConsumerState<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends ConsumerState<OnBoardingView> {
  late OnBoardVM onBoardVM;
  late int currentIndex;
  final PageController pageController = PageController();

  List<OnBoardModel> onboardList =[] ;

  @override
  void initState() {
    handleOnBoardList();

    super.initState();
  }

  initBuild() {
    onBoardVM = ref.watch(onBoardProvider.notifier);
    currentIndex = ref.watch(onBoardProvider);
  }

  @override
  Widget build(BuildContext context) {
    initBuild();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
                    height: MySizes.largePadding,
                    child: currentIndex <= 1
                        ? TextButton(
                            onPressed: () {
                              AppStorage.saveOnBoardStatus(true);
                              Get.offAllNamed(WelcomeRouting.config().path);
                            },
                            child: Text(LangEnum.skip.tr()),
                          )
                        : const SizedBox.shrink())
                .onlyPadding(
                    MySizes.largePadding, MySizes.largePadding * 2, 0, 0),
            Expanded(
                child: PageView(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) =>
                  onBoardVM.changePageIndex(currentIndex: index),
              children: List.generate(
                onboardList.length,
                (index) => Item(
                  title: onboardList[index].title ?? '',
                  description: onboardList[index].description ?? '',
                  image: onboardList[index].image ?? '',
                ),
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                  height: 3,
                  width: MySizes.defaultPadding,
                  margin: const EdgeInsets.symmetric(
                      horizontal: MySizes.defaultPadding * .25),
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? context.color.primary
                        : context.color.primaryContainer,
                    borderRadius: MySizes.circleBorderRadius,
                  ),
                ),
              ),
            ),
            30.ph,
            SizedBox(
              height: MySizes.buttonHeight + MySizes.largePadding,
              child: currentIndex == 2
                  ? Column(
                      children: [
                        15.ph,
                        ElevatedButton(
                          onPressed: () {
                            AppStorage.saveOnBoardStatus(true);
                            Get.offAllNamed(WelcomeRouting.config().path);
                          },
                          child: Text(LangEnum.start.tr()),
                        ),
                        15.ph,
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ).hPadding(MySizes.largePadding),
      ),
    );
  }


  void handleOnBoardList() {
    onboardList.clear();
    onboardList.addAll(
        onboardList = [
          OnBoardModel(
            title: LangEnum.onboardTitle1.tr(),
            description: LangEnum.onboardDes1.tr(),
            image: Images.onboard1,
          ),
          OnBoardModel(
            title: LangEnum.onboardTitle2.tr(),
            description: LangEnum.onboardDes2.tr(),
            image: Images.onboard2,
          ),
          OnBoardModel(
            title: LangEnum.onboardTitle3.tr(),
            description: LangEnum.onboardDes3.tr(),
            image: Images.onboard3,
          ),
        ]
    );
  }
}
