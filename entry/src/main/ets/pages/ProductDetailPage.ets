import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { Header } from '../components/ComComponents'

@Entry
@Component
struct ProductDetailPage {
  @State params: any = router.getParams()

  build() {
    Column() {
      Header({ title: '商品详情',
        leftEvent: () => {
          router.showAlertBeforeBackPage({ message: '商品支付未完成，确定返回吗' })
          router.back({ url: 'pages/Index', params: { tip: '从商品详情页返回首页' } })
        } })
      Column() {
        if (this.params?.productName) {
          Text(this.params.productName)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }
        if (this.params?.productPic) {
          Image(this.params.productPic)
            .width(300)
            .height(300)
        }
      }.width('100%').layoutWeight(1)
    }
    .width('100%').height('100%')
  }
}