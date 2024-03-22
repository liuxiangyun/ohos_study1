import { Header } from 'baseLib'
import common from '@ohos.app.ability.common'
import { Level } from '@ohos/hypium'


@Entry
@Component
struct Index {
  private docId: number = 1111
  @State docs: Array<Doc> = [
    new Doc(`文档${this.docId}`, '', 111),
    new Doc(`文档${this.docId++}`, '', 111),
    new Doc(`文档${this.docId++}`, '', 111)
  ]

  build() {
    Column({ space: 10 }) {
      Header({ leftImg: null, title: '文档' })
      Divider()
      Button('新建文档').onClick(() => {
        let doc = new Doc(`文档${this.docId++}`, '', 222)
        this.docs.push(doc)

        this.openDoc(doc.name)
      })
      List({ space: 10 }) {
        ForEach(this.docs, (doc: Doc) => {
          ListItem() {
            Text(doc.name)
              .backgroundColor(Color.Pink)
              .borderRadius(40)
              .padding({})
              .width("100%")
              .padding(10)
          }.onClick(() => {
            //跳转Ability
            this.openDoc(doc.name)

          })
        }, (item: Doc) => item.name)
      }.width("100%")
      .layoutWeight(1)

    }

    .width('100%')
  }

  openDoc(docName: string) {
    (getContext(this) as common.UIAbilityContext).startAbility({
      //显式意图
      // bundleName: 'com.lxy.study',
      // moduleName: 'doc',
      // abilityName: 'DocEditAbility',
      parameters: { docName: docName },
      //隐式意图 - 系统自动将打开的Ability 信息补全 =》 bundleName  moduleName abilityName
      action: 'action.doc.edit',
      entities: ['entity.doc.edit']
    })
  }
}

class Doc {
  name: string
  path: string
  size: number

  constructor(name: string, path: string, size: number) {
    this.name = name
    this.path = path
    this.size = size
  }
}