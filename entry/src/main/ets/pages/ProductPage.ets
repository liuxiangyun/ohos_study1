import resourceManager from '@ohos.resourceManager'
import { Header } from '../components/ComComponents'


@Entry
@Component
struct ProductPage {
  @State data: Product[] = [new Product('huawei mate40 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 3000, 2599),
    new Product('huawei mate40 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 4000),
    new Product('huawei mate50 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 5000),
    new Product('huawei mate60 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 6000, 5599),
    new Product('huawei mate70 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 7000),
    new Product('huawei mate80 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 8000)]
  private scroller: Scroller = new Scroller()

  build() {
    Column() {
      Header({
        title: "商品列表",
        leftImg: $r('app.media.ic_back'),
        rightImg: $r('app.media.ic_refresh'),
        leftEvent: () => {
          console.log("点击了 titleBar 左边的按钮")
        },
        rightEvent: () => {
          console.log("点击了 titleBar 右边的按钮")
        }
      })

      Row() {
        List({ space: 10, scroller: this.scroller }) {
          ForEach(this.data, (item: Product) => {
            ListItem() {
              this.ItemProduct(item)
            }
          })
        }
        .margin({ top: 15 })
        .layoutWeight(1)

        ScrollBar({ scroller: this.scroller }) {
          Text()
            .width(10)
            .height(80)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }
      }.width('100%').layoutWeight(1)

    }
    .alignItems(HorizontalAlign.Start)
    .fillScreen()

  }

  @Builder
  ItemProduct(product: Product) {
    Row() {
      Image(product.pic).width(130).height(130).borderRadius(10)
      Column() {
        Text(product.name).fontWeight(FontWeight.Bold).fontSize(20).maxLines(2)
        if (product.discount) {
          Text('￥' + product.price).margin({ top: 30 }).fontSize(20).fontColor(Color.Grey).decoration({
            type: TextDecorationType.LineThrough,
            color: Color.Grey
          })
          Text('折扣价：￥' + product.discount).margin({ top: 10 }).priceText()
        } else {
          Text('￥' + product.price).margin({ top: 30 }).priceText()
        }
      }.alignItems(HorizontalAlign.Start).height(130).layoutWeight(1)
      .margin(8)
    }.width('100%').backgroundColor(Color.White)
    .borderRadius(10)
  }
}


class Product {
  name: string
  pic: string
  price: number
  discount: number

  constructor(name: string, pic: string, price: number, discount?: number) {
    this.name = name
    this.pic = pic
    this.price = price
    this.discount = discount
  }
}


@Styles function fillScreen() {
  .width('100%')
  .height('100%')
  .padding(15)
  .backgroundColor('#EFEFEF')
}

@Extend(Text) function priceText() {
  .fontSize(20)
  .fontColor(Color.Red)
}