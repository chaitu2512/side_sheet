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
  @State outSetValue : number = 40
  @Builder sheetDesign(): any {
    Column() {
      Text("Labels")
        .fontSize(30)
        .margin({top : 8 , left : 16})
        .alignSelf(ItemAlign.Start)
        .fontWeight(FontWeight.Bolder)
      Row() {
        Checkbox({})
          .width(20)
          .height(20)
          .margin({ top: 4, left: 16 })
        Text("Travel")
          .fontSize(20)
          .margin({top :8 ,left : 12})
          .fontWeight(FontWeight.Medium)
      }.height(40)
      .alignSelf(ItemAlign.Start)
      Row() {
        Checkbox({})
          .width(20)
          .height(20)
          .margin({ top: 4, left: 16 })
        Text("Food/Beverage")
          .fontSize(20)
          .margin({top :8 ,left : 12})
          .fontWeight(FontWeight.Medium)
      }.height(40)
      .alignSelf(ItemAlign.Start)
      Row() {
        Checkbox({})
          .width(20)
          .height(20)
          .margin({ top: 4, left: 16 })
        Text("Education")
          .fontSize(20)
          .margin({top :8 ,left : 12})
          .fontWeight(FontWeight.Medium)
      }.height(40)
      .alignSelf(ItemAlign.Start)
      Row() {
        Checkbox({})
          .width(20)
          .height(20)
          .margin({ top: 4, left: 16 })
        Text("Others")
          .fontSize(20)
          .margin({top :8 ,left : 12})
          .fontWeight(FontWeight.Medium)
      }.height(40)
      .alignSelf(ItemAlign.Start)
      Row() {
        Image($r("app.media.dustbin"))
          .height(35)
          .width(35)
          .margin({left : 16})
        Text("Remove")
          .fontSize(20)
          .margin({top :8 ,left : 12})
        .fontWeight(FontWeight.Bold)
      }.margin({top: 16})
      .alignSelf(ItemAlign.Start)
      Row() {
        Image($r("app.media.download"))
          .height(25)
          .width(25)
          .margin({left : 16})
        Text("Download")
          .fontSize(20)
          .margin({ top :8 ,left : 16})
          .fontWeight(FontWeight.Bold)
      }.margin({top: 16})
      .alignSelf(ItemAlign.Start)
      Text("Range")
        .fontSize(28)
        .margin({top : 8 , left : 16})
        .alignSelf(ItemAlign.Start)
        .fontWeight(FontWeight.Bold)
        .margin({top: 24 , left : 16})
      Row() {
        Slider({
          value: this.outSetValue,
          min: 0,
          max: 100,
          step: 5,
          style: SliderStyle.OutSet
        })
          .blockColor(Color.Blue)
          .trackColor(Color.Gray)
          .selectedColor(Color.Blue)
          .showSteps(true)
          .showTips(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.outSetValue = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
       // Text(this.outSetValue.toFixed(0)).fontSize(16)
      }
      .width('90%')
      .margin({top : 16})
    }
    .width("100%")
  }
  aboutToAppear(){
    this.sheetSide.setSheetBorderColor("#ffdbdbdb")
    this.sheetSide.setSheetSide(sheetPosition.right)
    this.sheetSide.setSheetColor("#ffffffff")
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