export enum sheetPosition {
  left,
  right
}

export class sideSheetModel {

  private sheetWidthPercent : number = 70
  private sheetColor : Color | Resource | string = Color.Orange
  private sheetGrayShade : Color | Resource | string = "#54635343"
  private sheetSide : sheetPosition = sheetPosition.left
  private sheetBorderWidth : number | string = "4vp"
  private sheetBorderColor : Color | Resource | string = Color.Black
  private sheetShadowColor : Color | Resource | string = Color.Grey
  private sheetShadowRadius : number  = 40
  setSheetWidthPercent( sheetWidthPercent : number ){
    this.sheetWidthPercent = (sheetWidthPercent == null || sheetWidthPercent >90) ? 90 : sheetWidthPercent
    return this
  }
  getSheetWidthPercent() : number{
    return this.sheetWidthPercent
  }

  setSheetColor(sheetColor : Color | Resource | string ){
    this.sheetColor = sheetColor == null ? Color.Orange : sheetColor
    return this
  }
  getSheetColor() : Color | Resource | string{
    return this.sheetColor
  }
  setSheetGrayShade(sheetGrayShade : Color | Resource | string ){
    this.sheetGrayShade = sheetGrayShade == null ? "#54635343" : sheetGrayShade
    return this
  }
  getSheetGrayShade() : Color | Resource | string{
    return this.sheetGrayShade
  }
  setSheetSide(sheetSide : sheetPosition){
    this.sheetSide =  sheetSide != null ? sheetSide : sheetPosition.left
    return this
  }
  getSheetSide() : sheetPosition{
    return this.sheetSide
  }
  setSheetBorderWidth(sheetBorderWidth : number | string){
    this.sheetBorderWidth = sheetBorderWidth == null ? "4vp" : sheetBorderWidth
    return this
  }
  getSheetBorderWidth() : number | string {
    return this.sheetBorderWidth
  }
  setSheetBorderColor(sheetBorderColor : Color | Resource | string){
    this.sheetBorderColor = sheetBorderColor == null ? Color.Black : sheetBorderColor
  }
  getSheetBorderColor() : Color | Resource | string {
    return this.sheetBorderColor
  }
  setSheetShadowColor(sheetShadowColor : Color | Resource | string ){
    this.sheetShadowColor = sheetShadowColor == null ? Color.Gray : sheetShadowColor
    return this
  }
  getSheetShadowColor() : Color | Resource | string{
    return this.sheetShadowColor
  }
  setSheetShadowRadius(sheetShadowRadius :  number ) {
    this.sheetShadowRadius = sheetShadowRadius == null ? 40 : sheetShadowRadius
    return this
  }
  getSheetShadowRadius() : number {
    return this.sheetShadowRadius
  }

}
