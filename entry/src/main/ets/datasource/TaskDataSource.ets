import { Task, TaskState } from '../pages/TaskListPage';
import { BasicDataSource } from './BasicDataSource';

export class TaskDataSource extends BasicDataSource {
  private tasks: Array<Task> = [new Task(), new Task(), new Task()]

  public getData(index: number): Task {
    return this.tasks[index]
  }

  public totalCount(): number {
    return this.tasks.length
  }

  public finishCount(): number {
    return this.tasks.filter((task) => task.state == TaskState.FINISH).length
  }

  public pushData(task: Task) {
    this.tasks.push(task)
    this.notifyDataAdd(this.tasks.length - 1)
  }

  public addData(index: number, task: Task) {
    this.tasks.splice(index, 0, task)
    this.notifyDataAdd(index)
  }

  public deleteData(task: Task) {
    const index = this.tasks.indexOf(task)
    if (index >= 0) {
      this.tasks.splice(index, 1)
      this.notifyDataDelete(index)
    }
  }
}