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

  ges() {
    // animateTo()
  }

  build() {
    Column() {
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

      }.width('100%')
      .layoutWeight(1)

      Button(this.anim ? 'start anim' : 'back').onClick(() => {
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

        this.httpRequest()
      }).enabled(this.isEnable)
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