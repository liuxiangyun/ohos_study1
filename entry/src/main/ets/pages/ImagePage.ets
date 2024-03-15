import router from '@ohos.router';
import { Header } from '../components/ComComponents';
//
//
// var test = 1
// let test1 = '111'
// const test2 = '111'
//
// // console.log('sss',test,'www',test1)
//
//
// if (test) {
//   console.log("有值");
// } else {
//   console.log("无值");
// }


// let array:Array<string>=['11','22','33']
//
// let array2:string[]=['155','266','377']
//
// for(const i in array){
//   console.log("key"+i+",value"+array[i])
// }
//
// for(const i of array2){
//   console.log(i.toString())
// }


// let sayHello=(name:string='陌生人'):boolean=>{
//   console.log('hello '+ name)
//   return name==="1"
// }
//
// console.log(sayHello('1')+"")


// enum Msg {
//   HI = 'hi', HELLO = 123
// }
//
//
// interface Say {
//   say(msg: Msg)
// }
//
// class MySay implements Say {
//   private m: Msg
//
//   say(msg: Msg) {
//     console.log((this.m ? this.m : msg).toString())
//   }
//
//   constructor(s: Msg) {
//     this.m = s
//   }
// }
//
// new MySay(Msg.HELLO).say(Msg.HI)


@Entry
@Component
struct ImagePage {
  defImageSize: number = 50
  @State message: string = 'Hello World'
  @State imageSize: number = this.defImageSize
  params: any = router.getParams()

  max() {
    let size = this.imageSize + 5
    size = this.check(size)
    this.imageSize = size
  }

  min() {
    let size = this.imageSize - 5
    size = this.check(size)
    this.imageSize = size
  }

  check(size: number): number {
    if (size > 70) {
      size = 70
    } else if (size < 10) {
      size = 70
    } else if (isNaN(size)) {
      size = this.defImageSize
    }
    return size
  }

  build() {

    Column() {
      Header({ title: this.params?.pageName })

      Row() {
        Image('https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1')
          .height(this.imageSize + '%')
          .width('100%')
          .objectFit(ImageFit.Contain)
          .interpolation(ImageInterpolation.High)
          .alt('https://t12.baidu.com/it/u=1869928635,214858621&fm=30&app=106&f=JPEG?w=640&h=640&s=1FA8782362E366BB881CD1430300F0E1')
      }.height('70%').justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center)

      Row() {

        Text('图片大小').fontSize(20).fontStyle(FontStyle.Normal).fontWeight(FontWeight.Bold)

        TextInput({ placeholder: '请输入图片大小(10-80)', text: this.imageSize.toFixed(0) })
          .type(InputType.Number)
          .backgroundColor('#FFF')
          .width(200)
          .onChange(value => {
            let size = parseInt(value)
            size = this.check(size)
            this.imageSize = size
            console.log(this.imageSize.toString())
          })
      }.width('100%').padding({ left: 15, right: 15 }).justifyContent(FlexAlign.SpaceBetween)

      Divider().strokeWidth(3).margin({ left: 15, right: 15 })


      Row() {
        Button('缩小').onClick(() => {
          this.min()
        })

        Button('放大').onClick(() => {
          this.max()
        })
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly).alignItems(VerticalAlign.Center).margin({ top: 15 })


      Slider({
        value: this.imageSize,
        min: 10,
        max: 80,
        step: 10,
        style: SliderStyle.InSet
      })
        .showSteps(true)
        .showTips(true)
        .backgroundColor('#FFFF00')
        .blockColor('#36d')
        .trackColor('#00adb4')
        .selectedColor('#000000')
        .onChange((value, mode) => {
          this.imageSize = value
        })
        .margin({ top: 15, left: 15, right: 15 })

    }
    .width('100%')
    .height('100%')
  }
}