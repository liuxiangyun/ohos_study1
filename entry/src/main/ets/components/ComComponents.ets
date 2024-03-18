import router from '@ohos.router'

@Component
export struct Header {
  private title: ResourceStr
  private leftImg: ResourceStr = $r('app.media.ic_back')
  private rightImg: Resource
  private leftEvent: (event?: ClickEvent) => void = () => router.back()
  private rightEvent: (event?: ClickEvent) => void
  @State params: any = router.getParams()

  getTitle(): ResourceStr {
    if (this.title) {
      return this.title
    } else if (this.params?.pageName) {
      return this.params.pageName
    } else {
      return $r('app.string.EntryAbility_label')
    }
  }

  build() {
    Row() {
      if (this.leftImg) {
        Image(this.leftImg).width(40).height(40).padding(3)
          .onClick(() => {
            if (this.leftEvent) {
              this.leftEvent()
            }
          })
      }
      if (this.getTitle()) {
        Text(this.getTitle())
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .layoutWeight(1)
      }
      if (this.rightImg) {
        Image(this.rightImg).width(40).height(40).padding(3)
          .onClick(() => {
            if (this.rightEvent) {
              this.rightEvent()
            }
          })
      }
    }
    .width('100%')
    .height(60)
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
    .padding({ left: 10, right: 10 })
  }
}


