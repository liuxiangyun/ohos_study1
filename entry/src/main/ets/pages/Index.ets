import router from '@ohos.router'
import { Header } from '../components/ComComponents'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State examples: Array<ExamplePage> = [
    new ExamplePage('图片查看', 1, 'pages/ImagePage'),
    new ExamplePage('商品列表', 2, 'pages/ProductPage'),
    new ExamplePage('任务列表', 3, 'pages/TaskListPage')]
  @State tip: string = ''

  onPageShow() {
    let backParams: any = router.getParams()
    this.tip = backParams?.tip
    console.log(`${this.tip}`)
  }

  build() {
    Column() {
      Header({ title: `案例列表`, leftImg: null })

      if (this.tip) {
        Text(this.tip)
      }

      List({ space: 20 }) {
        ForEach(this.examples, (example) => {
          ListItem() {
            Row() {
              Text(`${example.id}`)
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)

              Text(`${example.name}`)
                .fontColor(Color.White)
                .fontSize(20)
            }
            .backgroundColor(Color.Blue)
            .borderRadius(20)
            .justifyContent(FlexAlign.SpaceBetween)
            .padding(20)
            .width('100%')
            .onClick(() => {
              router.pushUrl({
                url: example.route,
                params: { pageName: `${example.id}.${example.name}` }
              }, router.RouterMode.Standard, (err) => {
                console.log(`route error ,${err.name} errorCode:${err.code} errorMessage:${err.message}}`)
              })
            })
          }
        })
      }.width('100%').layoutWeight(1)
      .padding(10)
    }
  }
}

class ExamplePage {
  name: string
  id: number
  route: string

  constructor(name: string, id: number, route: string) {
    this.name = name
    this.id = id
    this.route = route
  }
}