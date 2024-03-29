import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { Header } from 'baseLib'
import common from '@ohos.app.ability.common'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State examples: Array<ExamplePage> = [
    new ExamplePage('常用组件', 1, 'pages/ComponentsPage'),
    new ExamplePage('图片查看', 2, 'pages/ImagePage'),
    new ExamplePage('商品列表', 3, 'pages/ProductPage'),
    new ExamplePage('任务列表', 4, 'pages/TaskListPage'),
    new ExamplePage('动画介绍', 5, 'pages/AnimPage'),
    new ExamplePage('应用通知', 6, 'pages/NotificationPage'),
    new ExamplePage('应用数据', 7, 'pages/AppDataPage'),
    new ExamplePage('OHOffice', 8)]

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
        ForEach(this.examples, (example: ExamplePage) => {
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
              if (example.route) {
                //路由跳转
                router.pushUrl({
                  url: example.route,
                  params: { pageName: `${example.id}.${example.name}` }
                }, router.RouterMode.Standard, (err) => {
                  console.log(`route error ,${err.name} errorCode:${err.code} errorMessage:${err.message}}`)
                })
              } else {
                //Ability跳转
                this.openDocModule()
              }
            })
          }
        })
      }.width('100%').layoutWeight(1)
      .padding(10)
    }
  }

  async openDocModule() {
    try {
      let context = (getContext(this) as common.UIAbilityContext)
      await context.startAbility({
        bundleName: 'com.lxy.study',
        moduleName: 'doc',
        abilityName: 'DocAbility',
        // action:'action.doc.home',
      })
    } catch (err) {
      hilog.error(0x110, 'study', '%{public}s', err.code + '')
    }
  }
}

class ExamplePage {
  name: string
  id: number
  route?: string

  constructor(name: string, id: number, route?: string) {
    this.name = name
    this.id = id
    this.route = route
  }
}