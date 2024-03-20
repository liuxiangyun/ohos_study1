import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { Header } from '../components/ComComponents'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State examples: Array<ExamplePage> = [
    new ExamplePage('常用组件', 1, 'pages/ComponentsPage'),
    new ExamplePage('图片查看', 2, 'pages/ImagePage'),
    new ExamplePage('商品列表', 3, 'pages/ProductPage'),
    new ExamplePage('任务列表', 4, 'pages/TaskListPage'),
    new ExamplePage('动画介绍', 5, 'pages/AnimPage')]

  onPageShow() {
    this.showBackTip()

  }

  showBackTip() {
    const backParams: any = router.getParams()
    const tip = backParams?.tip
    if (tip) {
      promptAction.showToast({ message: tip })

      // promptAction.showDialog({
      //   title: '返回首页',
      //   message: tip,
      //   buttons: [
      //     {
      //       text: '是',
      //       color: '#89BCDD'
      //     },
      //     {
      //       text: '不确定',
      //       color: '#811CDD'
      //     },
      //     {
      //       text: '否',
      //       color: '#AABCDD'
      //     }
      //   ]
      // }).then().catch()
    }
  }

  build() {
    Column() {
      Header({ title: `案例列表`, leftImg: null })


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
            .backgroundColor('#11BBCC')
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