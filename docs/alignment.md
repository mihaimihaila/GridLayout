Items can be aligned both horizontally and vertically.
The available alignment options are:

```swift
public enum HorizontalAlignment {
    case left
    case center
    case right
    case stretch
}

public enum VerticalAlignment {
    case top
    case center
    case bottom
    case stretch
}
```

Here is one of the previous examples with `rectangle1` and `rectangle4` using an alignment other than `.center`.
```swift
let rectangle1 = buildRectangle(color: .blue)
let rectangle2 = buildRectangle(color: .red)
let rectangle3 = buildRectangle(color: .green)
let rectangle4 = buildRectangle(color: .magenta)

let grid = UIView.gridLayoutView(items: [GridItem(rectangle1, row: 0, column: 0, verticalAlignment: .top),
                                         GridItem(rectangle2, row: 0, column: 1),
                                         GridItem(rectangle3, row: 1, column: 0),
                                         GridItem(rectangle4, row: 1, column: 1, horizontalAlignment: .right)],
                                 rows: [.auto, .auto],
                                 columns: [.auto, .auto])
```
![Sample](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/10.png "Sample")

## Alignment and Auto Layout

Make sure any Auto Layout constraints you define on your items work well with the alignment you pick:

* Fixed size constraints and `stretch` cannot simultaneously be satisfied.
* Any alignmnent other than `stretch` is not enough to correctly position an item in the grid. Add addition constraints for the item size in such cases.