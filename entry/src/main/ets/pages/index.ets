import { MaterialSheet,sheetPosition ,sideSheetModel} from "@ohos/side-sheet"
@Entry
@Component
struct Index {
  @State sheetVisible: boolean = false
  @State sheetSide : sideSheetModel  = new sideSheetModel()
  @Builder sheetDesign(): any {
    Column() {
      Text("Add UI  here ")
        .fontSize(20)
    }
  }
  aboutToAppear(){
    this.sheetSide.setSheetBorderColor("#ff7a6b00")
    this.sheetSide.setSheetSide(sheetPosition.right)
  }
  build() {
    Stack() {
      Column() {

        Button('Show Sheet')
          .onClick(() => this.sheetVisible = true)

      }
      .width('100%')
      .height('100%')

      MaterialSheet({
        model : $sheetSide,
        body : this.sheetDesign,
        visible: $sheetVisible
      })
    }.height("100%")
    .width("100%")
  }
}