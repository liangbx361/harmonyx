import router from '@ohos.router';
import { CommonConstants } from '../../common/constants/CommonConstants';
import CopyrightComponent from '../../components/CopyrightComponent';
import AppRoutes from '../../routes/AppRoutes';

/**
 * SplashScreenPage is the entry of the application and shows how to develop a front page.
 * Stay in SplashScreenPage for seconds to jump to the MainPage.
 * Developers can replace background images with advertising videos.
 */
@Entry
@Component
struct SplashPage {
  @State pageShowTime: number = CommonConstants.TIME_DEFAULT_VALUE;
  @State intervalID: number = CommonConstants.INTERVAL_ID_DEFAULT;

  build() {
    Column() {
      Stack({ alignContent: Alignment.TopStart }) {
        Image($r('app.media.ic_splash_page_background'))
          .width('100%')
          .height('100%')

        AdvertiseIcon()

        SkipButton({ secondsCount: (CommonConstants.DELAY_SECONDS - this.pageShowTime) })
      }
      .layoutWeight(CommonConstants.STACK_LAYOUT_WEIGHT)
      .width('100%')

      CopyrightComponent()
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
  }

  /**
   * When the SplashScreenPage is displayed, switch to the next page after 3 seconds.
   */
  onPageShow() {
    this.intervalID = setInterval(() => {
      this.pageShowTime += CommonConstants.INCREMENT_VALUE;
      if (this.pageShowTime > CommonConstants.DELAY_SECONDS) {
        router.replaceUrl({
          url: AppRoutes.MAIN,
        });
      }
    }, CommonConstants.INTERVAL_DELAY);
  }

  /**
   * When the SplashScreenPage is hide, clear interval.
   */
  onPageHide() {
    clearInterval(this.intervalID);
  }
}

@Component
struct SkipButton {
  @Prop secondsCount: number;

  build() {
    Flex({
      direction: FlexDirection.Row,
      justifyContent: FlexAlign.End
    }) {
      Text($r('app.string.skip', this.secondsCount))
        .backgroundColor($r('app.color.rect_area_background'))
        .borderRadius(CommonConstants.SKIP_BUTTON_RADIUS)
        .fontColor(Color.White)
        .width($r('app.float.skip_text_width'))
        .height($r('app.float.skip_text_height'))
        .fontSize($r('app.float.skip_text_size'))
        .margin({
          right: $r('app.float.skip_text_margin_right'),
          top: $r('app.float.skip_text_margin_top')
        })
        .textAlign(TextAlign.Center)
        .border({ width: CommonConstants.SKIP_TEXT_BORDER_WIDTH })
        .borderColor($r('app.color.rect_stroke'))
        .onClick(() => {
          router.replaceUrl({
            url: CommonConstants.MAIN_PAGE_URL
          });
        })
    }
  }
}

@Component
struct AdvertiseIcon {
  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.End
    }) {
      Image($r('app.media.ic_advertise'))
        .objectFit(ImageFit.Contain)
        .width($r('app.float.advertise_button_width'))
        .height($r('app.float.advertise_button_height'))
    }
    .margin($r('app.float.advertise_icon_margin'))
  }
}