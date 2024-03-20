@Entry
@Component
struct GridRowColPage {
  @State colors: Array<Color> = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]

  build() {
    Column({ space: 20 }) {
      GridRow({
        gutter: 10,
        breakpoints: {
          value: ['200vp', '300vp', '400vp', '500vp', '600vp'],
          reference: BreakpointsReference.WindowSize
        },
        direction: GridRowDirection.RowReverse
      }) {
        ForEach(this.colors, (color, index) => {
          GridCol({
            span: {
              xs: 2,
              sm: 3,
              md: 4,
              lg: 6,
              xl: 8,
              xxl: 12
            }
          }) {
            Text(`${index}`).backgroundColor(color).fontColor(Color.Black).width('100%').height('50vp')
          }
        })
      }.width('100%')
      .height('50%')


      GridRow() {
        GridCol({ span: { sm: 12 } }) {
          GridRow() {
            GridCol({ span: { sm: 2 } }) {
              Row() {
                Text('left').fontSize(24)
              }
              .justifyContent(FlexAlign.Center)
              .height('90%')
            }.backgroundColor('#ff41dbaa')

            GridCol({ span: { sm: 10 } }) {
              Row() {
                Text('right').fontSize(24)
              }
              .justifyContent(FlexAlign.Center)
              .height('90%')
            }.backgroundColor('#ff4168db')
          }
          .backgroundColor('#19000000')
          .height('100%')
        }

        GridCol({ span: { sm: 12 } }) {
          Row() {
            Text('footer').width('100%').textAlign(TextAlign.Center)
          }.width('100%').height('10%').backgroundColor(Color.Pink)
        }
      }.width('100%').height('50%')
    }
  }
}