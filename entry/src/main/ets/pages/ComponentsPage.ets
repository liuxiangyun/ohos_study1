import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { Header } from '../components/ComComponents'

@Entry
@Component
struct ComponentsPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Header({ title: '常用组件' })

      Flex() {
        Text('Flex')
          .textStyle(Color.Red)
          .onClick(() => {
            router.pushUrl({ url: 'pages/FlexPage' }).then(() => {
              promptAction.showToast({ message: 'router:跳转 pages/FlexPage' })
            }).catch(() => {
              promptAction.showToast({ message: 'router:跳转 pages/FlexPage 失败' })
            })
          })

        Text('Stack')
          .textStyle(Color.Pink)
          .onClick(() => {
            router.pushUrl({ url: 'pages/StackPage' }).then(() => {
              promptAction.showToast({ message: 'router:跳转 pages/StackPage' })
            }).catch(() => {
              promptAction.showToast({ message: 'router:跳转 pages/StackPage 失败' })
            })
          })
      }.width('100%')
      .layoutWeight(1)

    }.width('100%')
    .height('100%')

  }
}

@Extend(Text) function textStyle(color: ResourceColor) {
  .width('30%')
  .height(50)
  .textAlign(TextAlign.Center)
  .backgroundColor(color)
  .fontColor(Color.White)
  .fontSize(20)
}