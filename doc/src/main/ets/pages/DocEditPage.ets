import { Header } from 'baseLib/src/main/ets/components/ComComponents'
import common from '@ohos.app.ability.common'

@Entry
@Component
struct DocEditPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {

        Header({ title: '编辑文档', leftEvent: () => {
          (getContext(this) as common.UIAbilityContext).terminateSelf()

        } })


        TextArea().width('100%').layoutWeight(1).backgroundColor(Color.Grey)
      }
      .width('100%')
    }
    .height('100%')
  }
}