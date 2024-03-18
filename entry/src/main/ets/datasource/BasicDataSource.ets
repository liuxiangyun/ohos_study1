export class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = []

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const position = this.listeners.indexOf(listener)
    if (position >= 0) {
      this.listeners.splice(position, 1)
    }
  }

  getData(index: number): any {
    return undefined
  }

  totalCount(): number {
    return 0
  }

  notifyDataReloaded() {
    this.listeners.forEach((listener) => listener.onDataReloaded())
  }

  notifyDataAdd(index: number) {
    this.listeners.forEach((listener) => listener.onDataAdd(index))
  }

  notifyDataMove(from: number, to: number) {
    this.listeners.forEach((listener) => listener.onDataMove(from, to))
  }

  notifyDataDelete(index: number) {
    this.listeners.forEach((listener) => listener.onDataDelete(index))
  }

  notifyDataChange(index: number) {
    this.listeners.forEach((listener) => listener.onDataChange(index))
  }
}
