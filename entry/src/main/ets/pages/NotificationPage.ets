import notificationManager from '@ohos.notificationManager';
import notification from '@ohos.notification';
import promptAction from '@ohos.promptAction';
import image from '@ohos.multimedia.image';
import { Header } from 'baseLib';

@Entry
@Component
struct NotificationPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Header()

      Column({ space: 5 }) {
        Button('文本类型通知').onClick(() => this.publishTextNotification())

        Button('长文本类型通知').onClick(() => this.publishLongTextNotification())

        Button('图片类型通知').onClick(() => this.publicPicNotification())
      }
      .width('100%')
    }
    .height('100%')
  }

  publishTextNotification() {
    notificationManager.publish({
      content: { contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: 'title',
          text: 'text',
          additionalText: 'additionalText'
        } },
      id: 111,
      groupName: 'testNotification',
      slotType: notificationManager.SlotType.CONTENT_INFORMATION,
    }).then(result => {
      promptAction.showToast({ message: '文本类型通知发布成功' })
    }).catch(err => {
      promptAction.showToast({ message: `${err}` })
    })
  }

  publishLongTextNotification() {
    notificationManager.publish({
      content: { contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
        longText: {
          title: 'title',
          text: 'text',
          longText: 'longTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongText',
          briefText: 'briefText',
          expandedTitle: 'expandedTitle'
        } },
      id: 222,
      groupName: 'testNotification',
      slotType: notificationManager.SlotType.SOCIAL_COMMUNICATION
    }).then(result => {
      promptAction.showToast({ message: '文本类型通知发布成功' })
    }).catch(err => {
      promptAction.showToast({ message: `${err}` })
    })
  }

  async publicPicNotification() {
    // 将资源图片转化为PixelMap对象
    getContext(this).resourceManager.getMediaContent($r('app.media.ic_delete'))
    let resourceManager = getContext(this).resourceManager;
    let imageArray = await resourceManager.getMediaContent($r('app.media.ic_delete').id);
    let imageResource = image.createImageSource(imageArray.buffer);
    let pixelMap = await imageResource.createPixelMap({ desiredSize: { width: 100, height: 100 } });
    // 需要获取图片PixelMap信息
    let notificationRequest: notificationManager.NotificationRequest = {
      id: 333,
      groupName: 'testNotification',
      slotType: notificationManager.SlotType.SERVICE_INFORMATION,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
        picture: {
          title: 'test_title',
          text: 'test_text',
          additionalText: 'test_additionalText',
          briefText: 'test_briefText',
          expandedTitle: 'test_expandedTitle',
          picture: pixelMap
        }
      }
    };

    // 发布通知
    notificationManager.publish(notificationRequest, (err) => {
      if (err) {
        console.error(`Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
        return;
      }
      console.info('Succeeded in publishing notification.');
    });
  }
}