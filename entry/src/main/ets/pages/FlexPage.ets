@Entry
@Component
struct FlexPage {
  @State message: string = 'Hello World'

  build() {
    Column({ space: 10 }) {
      Flex({
        direction: FlexDirection.Row,
        wrap: FlexWrap.Wrap,
        justifyContent: FlexAlign.SpaceEvenly,
        alignItems: ItemAlign.Center,
        alignContent: FlexAlign.SpaceEvenly
      }) {
        Text('1').textStyle(Color.Red).height(50).alignSelf(ItemAlign.Start)
        Text('2').textStyle(Color.Pink).height(60)
        Text('3').textStyle(Color.Brown).height(70)
        Text('4').textStyle(Color.Red).height(50)
        Text('5').textStyle(Color.Pink).height(60)
        Text('6').textStyle(Color.Orange).height(70)
      }
      .width('100%')
      .height('30%')
      .backgroundColor(Color.Grey)


      Flex({ direction: FlexDirection.Row,
        wrap: FlexWrap.NoWrap,
        justifyContent: FlexAlign.SpaceEvenly,
        alignItems: ItemAlign.Center,
      }) {
        //alignSelf 不换行模式下才有效
        //flexBasis 不换行模式下才有效
        Text('1').textStyle(Color.Red).height(50).alignSelf(ItemAlign.Start)
        Text('2').textStyle(Color.Pink).height(60)
        Text('3').textStyle(Color.Brown).height(70).alignSelf(ItemAlign.Stretch)
        Text('4').textStyle(Color.Red).height(50).alignSelf(ItemAlign.End)
        Text('5').textStyle(Color.Pink).height(60)
        Text('6').textStyle(Color.Orange).height(70).alignSelf(ItemAlign.Baseline)

        Text('7777').backgroundColor(Color.White).width(100).flexBasis(300)
      }.width('100%')
      .height('30%')
      .backgroundColor(Color.Grey)

      Flex({ direction: FlexDirection.Row,
        wrap: FlexWrap.NoWrap,
        justifyContent: FlexAlign.SpaceEvenly,
        alignItems: ItemAlign.Center,
      }) {
        //flexGrow 不换行模式下才有效，并且要有剩余空间
        Text('1').textStyle(Color.Red).width('99%').height(50).flexShrink(100)
        Text('2').textStyle(Color.Pink).width('10%').height(60).flexGrow(1).flexShrink(1)
        Text('3').textStyle(Color.Brown).width('10%').height(70).flexGrow(2)
      }.width('100%')
      .height('50%')
      .backgroundColor(Color.Grey)
    }.width('100%')
    .height('100%')
    .padding(10)
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