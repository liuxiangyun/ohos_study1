import { Header } from 'baseLib'
@Entry
@Component
struct AppDataPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Header()
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}