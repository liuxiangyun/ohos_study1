import router from '@ohos.router'

@Component
export struct Header {
  private title: ResourceStr = $r('app.string.EntryAbility_label')
  private leftImg: ResourceStr = $r('app.media.ic_back')
  private rightImg: Resource
  private leftEvent: (event?: ClickEvent) => void
  private rightEvent: (event?: ClickEvent) => void

  build() {
    Row() {
      if (this.leftImg) {
        Image(this.leftImg).width(40).height(40).padding(3)
          .onClick(() => this.leftEvent())
      }
      if (this.title) {
        Text(this.title)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .textAlign(TextAlign.Center)
          .layoutWeight(1)
      }
      if (this.rightImg) {
        Image(this.rightImg).width(40).height(40).padding(3)
          .onClick(() => this.rightEvent())
      }
    }
    .width('100%')
    .height(60)
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
    .padding({ left: 10, right: 10 })
  }
}


