import { Header } from 'baseLib'
import { TaskDataSource } from '../datasource/TaskDataSource'

@Entry
@Component
struct TaskListPage {
  @Provide taskInfo: TaskInfo = new TaskInfo()

  build() {
    Column({ space: 20 }) {
      Header()

      //任务进度
      TaskProcess({ taskInfo: $taskInfo })

      //任务列表
      TaskList()

      //懒加载 任务列表
      // LazyTaskList()

    }.fillScreen()
  }
}


@Component
struct TaskProcess {
  @Link taskInfo: TaskInfo

  build() {
    Row() {
      Text("任务进度:")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      Stack() {
        Text() {
          Span(`${this.taskInfo.finishTaskNum}`)
            .fontSize(25)
            .fontColor(Color.Green)
          Span(' / ')
            .fontSize(25)
          Span(`${this.taskInfo.totalTaskNum}`)
            .fontSize(25)
            .fontColor(Color.Red)
        }

        Progress({ value: this.taskInfo.finishTaskNum, total: this.taskInfo.totalTaskNum, type: ProgressType.Ring })
          .width(100)
          .height(100)
      }

    }
    .width('100%')
    .padding({ left: 15, right: 15, top: 20, bottom: 20 })
    .borderRadius(10)
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}


@Component
struct LazyTaskList {
  @Consume taskInfo: TaskInfo
  private taskDataSource: TaskDataSource = new TaskDataSource()

  aboutToAppear() {
    this.refreshTaskProcess()
  }

  build() {
    Column({ space: 20 }) {
      //添加任务
      Button('新增任务')
        .width('50%')
        .onClick(() => {
          this.taskDataSource.pushData(new Task())
          this.refreshTaskProcess()
        })

      List({ space: 10, scroller: new Scroller() }) {
        LazyForEach(this.taskDataSource, (task: Task) => {
          ListItem() {
            TaskItem({ task: task, changeTask: () => {
              this.refreshTaskProcess()
            } })
          }.swipeAction({
            end: this.deleteBtn(task)
          })
        })
      }.width('100%')
      .cachedCount(5)
      .layoutWeight(1)
    }

  }

  refreshTaskProcess() {
    this.taskInfo.finishTaskNum = this.taskDataSource.finishCount()
    this.taskInfo.totalTaskNum = this.taskDataSource.totalCount()
  }

  @Builder deleteBtn(task: Task) {
    Button() {
      Image($r('app.media.ic_delete'))
        .fillColor(Color.White)
        .width(20)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(10)
    .onClick(() => {
      this.taskDataSource.deleteData(task)
      this.refreshTaskProcess()
    })
  }
}

@Component
struct TaskList {
  @Consume taskInfo: TaskInfo
  @State @Watch('refreshTaskProcess') tasks: Array<Task> = []

  build() {
    Column({ space: 20 }) {
      //添加任务
      Button('新增任务')
        .width('50%')
        .onClick(() => {
          this.tasks.push(new Task())
        })

      List({ space: 10, scroller: new Scroller() }) {
        ForEach(this.tasks, (task: Task, index: number) => {
          ListItem() {
            // TaskItem({ task: task, refreshTaskProcess: this.refreshTaskProcess.bind(this) })

            TaskItem({ task: task, changeTask: () => {
              this.refreshTaskProcess()
            } })
          }.swipeAction({
            end: this.deleteBtn(index)
          })
        })
      }.width('100%')
      .layoutWeight(1)
    }

  }

  refreshTaskProcess() {
    this.taskInfo.finishTaskNum = this.tasks.filter(value => value.state === TaskState.FINISH).length
    this.taskInfo.totalTaskNum = this.tasks.length
  }

  @Builder deleteBtn(index: number) {
    Button() {
      Image($r('app.media.ic_delete'))
        .fillColor(Color.White)
        .width(20)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(10)
    .onClick(() => {
      this.tasks.splice(index, 1)
    })
  }
}

@Component
struct TaskItem {
  @ObjectLink task: Task
  changeTask: () => void

  build() {
    Row() {
      if (this.task.state == TaskState.FINISH) {
        Text(this.task.name)
          .fontSize(20)
          .fontColor(Color.Gray)
          .decoration({ type: TextDecorationType.LineThrough })
      } else {
        Text(this.task.name)
          .fontSize(20)
          .fontColor(Color.Gray)
      }

      Checkbox().onChange((checked: boolean) => {
        if (checked) {
          this.task.state = TaskState.FINISH
        } else {
          this.task.state = TaskState.RUNNING
        }
        this.changeTask()
      })
        .select(this.task.state == TaskState.FINISH)
    }
    .width('100%')
    .height(65)
    .backgroundColor(Color.White)
    .borderRadius(10)
    .padding({ left: '15', right: '15' })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}


@Styles function fillScreen() {
  .width('100%')
  .height('100%')
  .padding(15)
  .backgroundColor('#EFEFEF')
}


class TaskInfo {
  finishTaskNum: number = 0
  totalTaskNum: number = 0
}

@Observed
export class Task {
  private static id: number = 0
  name: string = `任务${++Task.id}`
  state: TaskState = TaskState.RUNNING
}

export enum TaskState {
  RUNNING, FINISH
}