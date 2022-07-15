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

import { MaterialSheet, sheetPosition, sideSheetModel } from "@ohos/side-sheet"

@Entry
@Component
struct Index {
  @State sheetVisible: boolean = false
  @State sheetSide: sideSheetModel  = new sideSheetModel()
  @State outSetValue: number = 40
  @Builder design() : any {
    Column() {
      Text("Add UI here")
        .fontSize(30)
    }
  }
  @Builder sheetDesign(): any {
    Column() {
      Text("Labels")
        .fontSize("30fp")
        .margin({ top: "8vp", left: "16vp" })
        .alignSelf(ItemAlign.Start)
        .fontWeight(FontWeight.Bolder)
      Row() {
        Checkbox({})
          .width("20vp")
          .height("20vp")
          .margin({ top: "0vp", left: "16vp" })
        Text("Travel")
          .fontSize("20fp")
          .margin({ top: "8vp", left: "12vp" })
          .fontWeight(FontWeight.Medium)
      }.height("40vp")
      .alignSelf(ItemAlign.Start)

      Row() {
        Checkbox({})
          .width("20vp")
          .height("20vp")
          .margin({ top: "4vp", left: "16vp" })
        Text("Food/Beverage")
          .fontSize("20fp")
          .margin({ top: "8vp", left: "12vp" })
          .fontWeight(FontWeight.Medium)
      }.height("40vp")
      .alignSelf(ItemAlign.Start)

      Row() {
        Checkbox({})
          .width("20vp")
          .height("20vp")
          .margin({ top: "4vp", left: "16vp" })
        Text("Education")
          .fontSize("20fp")
          .margin({ top: "8vp", left: "12vp" })
          .fontWeight(FontWeight.Medium)
      }.height("40vp")
      .alignSelf(ItemAlign.Start)

      Row() {
        Checkbox({})
          .width("20vp")
          .height("20vp")
          .margin({ top: "4vp", left: "16vp" })
        Text("Others")
          .fontSize("20fp")
          .margin({ top: "8vp", left: "12vp" })
          .fontWeight(FontWeight.Medium)
      }.height("40vp")
      .alignSelf(ItemAlign.Start)

      Row() {
        Image($r("app.media.dustbin"))
          .height("35vp")
          .width("35vp")
          .margin({ left: "16vp" })
        Text("Remove")
          .fontSize("20vp")
          .margin({ top: "8vp", left: "12vp" })
          .fontWeight(FontWeight.Bold)
      }.margin({ top: "16vp" })
      .alignSelf(ItemAlign.Start)

      Row() {
        Image($r("app.media.download"))
          .height("25vp")
          .width("25vp")
          .margin({ left: "16vp" })
        Text("Download")
          .fontSize(20)
          .margin({ top: 8, left: 16 })
          .fontWeight(FontWeight.Bold)
      }.margin({ top: "16vp" })
      .alignSelf(ItemAlign.Start)

      Text("Range")
        .fontSize("28fp")
        .margin({ top: "8vp", left: "16vp" })
        .alignSelf(ItemAlign.Start)
        .fontWeight(FontWeight.Bold)
        .margin({ top: "24vp", left: "16vp" })
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
      }
      .width('90%')
      .margin({ top: "16vp" })
    }
    .width("100%")
  }

  aboutToAppear() {
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
        model: $sheetSide,
        body: this.design,
        visible: $sheetVisible
      })

    }.height("100%")
    .width("100%")
  }
}