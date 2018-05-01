```swift
let rectangle1 = buildRectangle(color: .blue)
let rectangle2 = buildRectangle(color: .red)

let grid = UIView.gridLayoutView(items: [GridItem(rectangle1,
                                                    row: 0,
                                                    column: 0),
                                            GridItem(rectangle2,
                                                    row: 1,
                                                    column: 0)],
                                    rowDefinitions: [RowDefinition(isAuto: true),
                                                    RowDefinition()],
                                    columnDefinitions: [ColumnDefinition()])
```
![Sample](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/7.png "Sample")

```swift
let rectangle1 = buildRectangle(color: .blue)
let rectangle2 = buildRectangle(color: .red)

let grid = UIView.gridLayoutView(items: [GridItem(rectangle1,
                                                    row: 0,
                                                    column: 0),
                                            GridItem(rectangle2,
                                                    row: 0,
                                                    column: 1)],
                                    rowDefinitions: [RowDefinition()],
                                    columnDefinitions: [ColumnDefinition(),
                                                        ColumnDefinition(isAuto: true)])
```
![Sample](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/8.png "Sample")