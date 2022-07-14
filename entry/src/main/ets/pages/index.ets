/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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