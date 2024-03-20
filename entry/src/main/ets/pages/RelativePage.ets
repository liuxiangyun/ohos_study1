@Entry
@Component
struct RelativePage {
  @State message: string = 'Hello World'

  build() {
    RelativeContainer() {
      Text('1')
        .width(50)
        .height(50)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Pink)
        .id('text1')
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })

      Text('2')
        .width(50)
        .height(50)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Orange)
        .id('text2')
        .alignRules({ center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center } })

      Text('3')
        .width(50)
        .height(50)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Brown)
        .id('text3')
        .alignRules({
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })

      Text('4')
        .width(50)
        .height(50)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Orange)
        .id('text4')
        .alignRules({
          top: { anchor: 'text2', align: VerticalAlign.Center },
          right: { anchor: 'text3', align: HorizontalAlign.Start }
        })
    }.width('100%')
    .height('100%')
  }
}