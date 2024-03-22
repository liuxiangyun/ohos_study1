import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { Header } from 'baseLib'

@Entry
@Component
struct ProductDetailPage {
  @State params: any = router.getParams()
  cus: CustomDialogController = new CustomDialogController({ builder: MyDialog() })

  build() {
    Column() {
      Header({ title: '商品详情',
        leftEvent: () => {

          AlertDialog.show({
            title: '是否返回',
            message: '商品支付未完成，确定返回吗？',
            autoCancel: true,
            alignment: DialogAlignment.Center,
            offset: { dx: 20, dy: 20 },
            primaryButton: { value: '是', fontColor: Color.Red, backgroundColor: Color.Orange, action: () => {
              router.back({ url: 'pages/Index', params: { tip: '从商品详情页返回首页' } })
            } },
            secondaryButton: { value: '否', fontColor: Color.Gray, backgroundColor: Color.Pink, action: () => {
              promptAction.showToast({ message: '取消返回' })
            } },
            cancel: () => {
              promptAction.showToast({ message: '点击遮罩关闭了AlertDialog' })
            }
          })
          this.cus.open()
          // router.showAlertBeforeBackPage({ message: '商品支付未完成，确定返回吗' })
          // router.back({ url: 'pages/Index', params: { tip: '从商品详情页返回首页' } })
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

@CustomDialog
 struct MyDialog {
  //必须具有该属性
  controller: CustomDialogController
  build() {
    Row() {
      Text('我是自定义弹窗')
    }
  }
}