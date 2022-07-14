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

import {sheetPosition , sideSheetModel} from "./sheetmodel"

@Component
export struct MaterialSheet {
  @Link visible: boolean
  @BuilderParam body: () => any
  @Link model : sideSheetModel
  private sheetWidth : string
  private sheetGrayWidth : string
  aboutToAppear(){
    this.sheetWidth = this.model.getSheetWidthPercent().toString()+"%"
    this.sheetGrayWidth = (100 -  this.model.getSheetWidthPercent()).toString()+"%"
  }
  build() {
    if (this.visible) {
      if(this.model.getSheetSide() == sheetPosition.left) {
        Row() {
          Column() {
            this.body()
          }
          .width(this.sheetWidth)
          .position({ x: 0, y: 0 })
          .height('100%')
          .backgroundColor(this.model.getSheetColor())
          .shadow({ radius : this.model.getSheetShadowRadius(), color : this.model.getSheetShadowColor() })
          .borderWidth(this.model.getSheetBorderWidth())
          .borderColor(this.model.getSheetBorderColor())

          //        .transition({ type: TransitionType.Insert, scale: { x: 1.0, centerX: 0.0 } })
          //        .transition({ type: TransitionType.Delete, scale: { x: 1.0, centerX: 0.0} })
          Column() {

          }
          .width(this.sheetGrayWidth)
          .position({ x: this.sheetWidth, y: 0 })
          .backgroundColor(this.model.getSheetGrayShade())
          .height("100%")
          .onClick(() => this.visible = false)
        }
        .height('100%')
        .width('100%')
      }
      if(this.model.getSheetSide() == sheetPosition.right){
        if (this.visible) {
          Row() {
            Column() {

            }
            .width(this.sheetGrayWidth)
            .position({ x: 0, y: 0 })
            .backgroundColor(this.model.getSheetGrayShade())
            .height("100%")
            .onClick(() => this.visible = false)

            Column() {
              this.body()
            }
            .width(this.sheetWidth)
            .position({ x: this.sheetGrayWidth, y: 0 })
            .height('100%')
            .backgroundColor(this.model.getSheetColor())
            .shadow({ radius : this.model.getSheetShadowRadius(), color : this.model.getSheetShadowColor() })
            .borderWidth(this.model.getSheetBorderWidth())
            .borderColor(this.model.getSheetBorderColor())
            //        .transition({ type: TransitionType.Insert, scale: { x: 1.0, centerX: 0.0 } })
            //        .transition({ type: TransitionType.Delete, scale: { x: 1.0, centerX: 0.0} })
          }
          .height('100%')
          .width('100%')
        }
      }
    }
  }
}

export {sheetPosition , sideSheetModel} from "./sheetmodel"
