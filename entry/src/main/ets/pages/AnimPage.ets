import http from '@ohos.net.http'

@Entry
@Component
struct AnimPage {
  @State widthImage: number = 20
  @State heightImage: number = 20
  @State color: Color = Color.Black
  @State xImage: number = 20
  @State yImage: number = 20
  @State xScale: number = 1
  @State yScale: number = 1
  @State angle: number = 0
  @State anim: boolean = false
  @State isEnable: boolean = true
  @State isEnable2: boolean = true
  @State showSmilingFace: boolean = false

  startAnim() {
    animateTo({
      duration: 1000,
      delay: 0,
      curve: Curve.EaseInOut,
      playMode: PlayMode.Normal,
      iterations: 1,
      onFinish: () => {
        this.anim = !this.anim
        this.isEnable2 = true
      }
    }, () => {
      if (this.anim) {
        this.xImage = 200
        this.yImage = 300
        this.xScale = 3
        this.yScale = 3
        this.color = Color.Red
        this.angle = 180
        this.widthImage = 100
        this.heightImage = 100
      } else {
        this.xImage = 20
        this.yImage = 20
        this.xScale = 1
        this.yScale = 1
        this.color = Color.Black
        this.angle = 0
        this.widthImage = 20
        this.heightImage = 20
      }
    })
  }

  build() {
    Column({ space: 10 }) {
      Stack() {
        Image($r('app.media.ic_delete'))
          .fillColor(this.color)
          .width(this.widthImage)
          .height(this.heightImage)
          .scale({ x: this.xScale, y: this.yScale, centerX: '50%', centerY: '50%' })
          .rotate({ angle: this.angle })
          .position({ x: this.xImage, y: this.yImage })
          .animation({
            duration: 1000,
            delay: 0,
            curve: Curve.EaseInOut,
            playMode: PlayMode.Normal,
            iterations: 1,
            onFinish: () => {
              this.anim = !this.anim
              this.isEnable = true
            }
          })

        Button(this.anim ? 'start anim(属性动画)' : 'back(属性动画)').onClick(() => {
          this.isEnable = false
          if (this.anim) {
            this.xImage = 200
            this.yImage = 300
            this.xScale = 3
            this.yScale = 3
            this.color = Color.Red
            this.angle = 180
            this.widthImage = 100
            this.heightImage = 100
          } else {
            this.xImage = 20
            this.yImage = 20
            this.xScale = 1
            this.yScale = 1
            this.color = Color.Black
            this.angle = 0
            this.widthImage = 20
            this.heightImage = 20
          }
        }).enabled(this.isEnable)
      }.width('100%')
      .height('40%')


      Stack() {
        Image($r('app.media.ic_grid'))
          .fillColor(this.color)
          .width(this.widthImage)
          .height(this.heightImage)
          .scale({ x: this.xScale, y: this.yScale, centerX: '50%', centerY: '50%' })
          .rotate({ angle: this.angle })
          .position({ x: this.xImage, y: this.yImage })


        Button(this.anim ? 'start anim(显式动画)' : 'back(显式动画)').onClick(() => {
          this.isEnable2 = false
          this.startAnim()
        }).enabled(this.isEnable2)
      }.width('100%')
      .height('40%')

      Column() {
        if (this.showSmilingFace) {
          Text('☺').fontColor(Color.Pink).fontSize(30).fontWeight(FontWeight.Bold)
            .transition({
              opacity: 0,
              translate: { x: -50, y: -50 },
              scale: { x: 2, y: 2, centerX: '50%', centerY: '50%' },
              rotate: { angle: 360, centerX: '50%', centerY: '50%' }
            })
        }

        Button(this.showSmilingFace ? '删除笑脸(转场动画)' : '添加笑脸(转场动画)').onClick(() => {
          //转场动画只能使用animateTo触发
          animateTo({
            duration: 1000,
            delay: 0,
            curve: Curve.EaseInOut,
            playMode: PlayMode.Normal,
            iterations: 1
          }, () => {
            this.showSmilingFace = !this.showSmilingFace
          })
        })
      }.width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .layoutWeight(1)

    }
    .height('100%')
    .width('100%')
  }

  httpRequest() {
    let request = http.createHttp()
    request.request('http://www.baidu.com').then(data => {
      if (data.responseCode == http.ResponseCode.OK) {
        console.info(data.result.toString())
      }
    }).catch(err => {
      console.error(err.message)
    })

  }
}