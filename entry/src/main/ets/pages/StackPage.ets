@Entry
@Component
struct StackPage {
  build() {
    Stack() {
      //zIndex 数值越大显示层级越高
      Text('1').width(100).height(100).backgroundColor(Color.Pink).zIndex(2)
      Text('2').width(200).height(200).backgroundColor(Color.Orange).zIndex(1)
      Text('3').width(300).height(300).backgroundColor(Color.White)
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Grey)
    .alignContent(Alignment.BottomEnd)
  }
}