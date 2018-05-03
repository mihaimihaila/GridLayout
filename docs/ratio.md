Grid rows and columns are not limited to same width columns and same height rows.
By defining a `ratio` for a row or a column, the layout of the grid will change accordingly.
```swift
let grid = UIView.gridLayoutView(items: [GridItem(rectangle1,
                                                          row: 0,
                                                          column: 0),
                                                 GridItem(rectangle2,
                                                          row: 0,
                                                          column: 1)],
                                         rowDefinitions: [RowDefinition()],
                                         columnDefinitions: [ColumnDefinition(ratio: 1),
                                                             ColumnDefinition(ratio: 2)])
```
This example defines two columns: the first with a ratio of 1 and the second with a ratio of 2. This means the horizontal space will be split in 3 units, with the first column taking 1 unit and the second column taking 2 units.

![Sample 5](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/5.png "Sample 5")

```swift
let rectangle1 = buildRectangle(color: .blue)
let rectangle2 = buildRectangle(color: .red)

let grid = UIView.gridLayoutView(items: [GridItem(rectangle1,
                                                    row: 0,
                                                    column: 0),
                                            GridItem(rectangle2,
                                                    row: 1,
                                                    column: 0)],
                                    rowDefinitions: [RowDefinition(ratio: 1),
                                                    RowDefinition(ratio: 3)],
                                    columnDefinitions: [ColumnDefinition()])
```
This example defines two rows: the first with a ratio of 1 and the second with a ratio of 3. This means the vertical space will be split in 4 units, with the first row taking 1 unit and the second row taking 3 units.

![Sample](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/6.png "Sample")