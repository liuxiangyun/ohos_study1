import resourceManager from '@ohos.resourceManager'
import router from '@ohos.router'
import { Header } from 'baseLib'


@Entry
@Component
struct ProductPage {
  @State phoneData: Product[] = [new Product('huawei mate40 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 3000, 2599),
    new Product('huawei mate40 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 4000),
    new Product('huawei mate50 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 5000),
    new Product('huawei mate60 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 6000, 5599),
    new Product('huawei mate70 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 7000),
    new Product('huawei mate80 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 8000),
    new Product('huawei mate40 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 3000, 2599),
    new Product('huawei mate40 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 4000),
    new Product('huawei mate50 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 5000),
    new Product('huawei mate60 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 6000, 5599),
    new Product('huawei mate70 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 7000),
    new Product('huawei mate80 pro', 'https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1', 8000)]
  @State computerData: Product[] = [new Product('huawei mate40 pro', 'https://x0.ifengimg.com/res/2022/A95A4C997EB9279706459BECC61C2ABA22CC8C9E_size395_w1440_h1328.jpg', 3000, 2599),
    new Product('huawei mate40 pro', 'https://x0.ifengimg.com/res/2022/A95A4C997EB9279706459BECC61C2ABA22CC8C9E_size395_w1440_h1328.jpg', 4000),
    new Product('huawei mate50 pro', 'https://x0.ifengimg.com/res/2022/A95A4C997EB9279706459BECC61C2ABA22CC8C9E_size395_w1440_h1328.jpg', 5000),
    new Product('huawei mate60 pro', 'https://x0.ifengimg.com/res/2022/A95A4C997EB9279706459BECC61C2ABA22CC8C9E_size395_w1440_h1328.jpg', 6000, 5599),
    new Product('huawei mate70 pro', 'https://x0.ifengimg.com/res/2022/A95A4C997EB9279706459BECC61C2ABA22CC8C9E_size395_w1440_h1328.jpg', 7000),
    new Product('huawei mate80 pro', 'https://x0.ifengimg.com/res/2022/A95A4C997EB9279706459BECC61C2ABA22CC8C9E_size395_w1440_h1328.jpg', 8000),
    new Product('huawei mate40 pro', 'https://x0.ifengimg.com/res/2022/A95A4C997EB9279706459BECC61C2ABA22CC8C9E_size395_w1440_h1328.jpg', 3000, 2599),
    new Product('huawei mate40 pro', 'https://x0.ifengimg.com/res/2022/A95A4C997EB9279706459BECC61C2ABA22CC8C9E_size395_w1440_h1328.jpg', 4000),
    new Product('huawei mate50 pro', 'https://x0.ifengimg.com/res/2022/A95A4C997EB9279706459BECC61C2ABA22CC8C9E_size395_w1440_h1328.jpg', 5000),
    new Product('huawei mate60 pro', 'https://x0.ifengimg.com/res/2022/A95A4C997EB9279706459BECC61C2ABA22CC8C9E_size395_w1440_h1328.jpg', 6000, 5599),
    new Product('huawei mate70 pro', 'https://x0.ifengimg.com/res/2022/A95A4C997EB9279706459BECC61C2ABA22CC8C9E_size395_w1440_h1328.jpg', 7000),
    new Product('huawei mate80 pro', 'https://x0.ifengimg.com/res/2022/A95A4C997EB9279706459BECC61C2ABA22CC8C9E_size395_w1440_h1328.jpg', 8000)]
  @State viewGrid: boolean = false
  @State tabCurIndex: number = 0

  switchView() {
    this.viewGrid = !this.viewGrid
  }

  build() {
    Column() {
      if (this.viewGrid) {
        Header({ rightImg: $r('app.media.ic_list'), rightEvent: () => this.switchView() })
      } else {
        Header({ rightImg: $r('app.media.ic_grid'), rightEvent: () => this.switchView() })
      }

      Tabs({ barPosition: BarPosition.Start, index: this.tabCurIndex, controller: new TabsController() }) {
        TabContent() {
          TabProduct({ data: $phoneData, viewGrid: this.viewGrid })
        }.tabBar(this.tab('手机', 0))

        TabContent() {
          TabProduct({ data: $computerData, viewGrid: this.viewGrid })
        }.tabBar(this.tab('电脑', 1))
      }
      .height('100%')
      .layoutWeight(1)
      .barHeight('50')
      .barWidth('100%')
      .vertical(false)
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.tabCurIndex = index
      })
    }
    .fillScreen()
  }

  @Builder
  tab(text: ResourceStr, tabIndex: number) {
    Text(text)
      .fontColor(this.tabCurIndex == tabIndex ? Color.Red : Color.Gray)
      .fontSize(this.tabCurIndex == tabIndex ? 25 : 20)
      .fontWeight(this.tabCurIndex == tabIndex ? FontWeight.Bold : FontWeight.Normal)
  }
}

@Component
struct TabProduct {
  @Link data: Product[]
  @Prop viewGrid: boolean
  private scroller = new Scroller()

  build() {
    Row() {
      if (this.viewGrid) {
        Grid(this.scroller) {
          ForEach(this.data, (item: Product) => {
            GridItem() {
              this.ItemGridProduct(item)
            }.onClick(() => {
              router.pushUrl({ url: 'pages/ProductDetailPage', params: {
                productName: item.name,
                productPic: item.pic
              } })
            })
          })
        }.columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .rowsGap(20)
        .layoutWeight(1)
      } else {
        List({ space: 10, scroller: this.scroller }) {
          ForEach(this.data, (item: Product) => {
            ListItem() {
              this.ItemListProduct(item)
            }.onClick(() => {
              router.pushUrl({ url: 'pages/ProductDetailPage', params: {
                productName: item.name,
                productPic: item.pic
              } })
            })
          })
        }
        .margin({ top: 15 })
        .layoutWeight(1)
      }

      ScrollBar({ scroller: this.scroller }) {
        Text()
          .width(10)
          .height(80)
          .borderRadius(10)
          .backgroundColor('#C0C0C0')
      }
    }.width('100%')
  }

  @Builder
  ItemListProduct(product: Product) {
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

  @Builder
  ItemGridProduct(product: Product) {
    Column() {
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
      }.alignItems(HorizontalAlign.Start).height(130)
      .margin({ top: 8 })
    }.width('100%').backgroundColor(Color.White)
    .borderRadius(10)
    .padding(8)
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