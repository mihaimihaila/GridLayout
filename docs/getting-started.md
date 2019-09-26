To define an empty grid, start by importing `GridLayout` module then use the `gridLayoutView` extension method on `UIView`:

```swift
let grid = UIView.gridLayoutView(items: [GridItem](),
                                 rows: [.auto],
                                 columns: [.auto])
```

So far this grid doesn't do much. It contains no `GridItem`, so it is the equivalent of an empty `UIView`.

#### Adding an item to the grid

```swift
let rectangle = UIView(frame: .zero)
rectangle.translatesAutoresizingMaskIntoConstraints = false
rectangle.backgroundColor = .blue
rectangle.widthAnchor.constraint(equalToConstant: 100).isActive = true
rectangle.heightAnchor.constraint(equalToConstant: 100).isActive = true

let grid = UIView.gridLayoutView(items: [GridItem(rectangle)],
                                 rows: [.auto],
                                 columns: [.auto])
```
![Adding an item to the grid](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/1.png "GridLayout sample: Adding an item to the grid")

#### Defining more rows
If we add one more row to the grid, `rectangle` will be centered in the top row:
```swift
let grid = UIView.gridLayoutView(items: [GridItem(rectangle)],
                                 rows: [.auto, .auto],
                                 columns: [.auto])
```
![Defining more rows](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/2.png "GridLayout sample: Defining more rows")

#### Defining more columns
In a similar fashion, if we add one more column instead, `rectangle` will be centered in the left column:
```swift
let grid = UIView.gridLayoutView(items: [GridItem(rectangle)],
                                 rows: [.auto],
                                 columns: [.auto, .auto])
```
![Defining more columns](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/3.png "GridLayout sample: Defining more columns")

#### Adding more items on various rows and columns
When we define more rows and columns, multiple items can be placed in the grid:
```swift
let rectangle1 = buildRectangle(color: .blue)
let rectangle2 = buildRectangle(color: .red)
let rectangle3 = buildRectangle(color: .green)
let rectangle4 = buildRectangle(color: .magenta)

let grid = UIView.gridLayoutView(items: [GridItem(rectangle1, row: 0, column: 0),
                                         GridItem(rectangle2, row: 1, column: 0),
                                         GridItem(rectangle3, row: 0, column: 1),
                                         GridItem(rectangle4, row: 1, column: 1)],
                                 rows: [.auto, .auto],
                                 columns: [.auto, .auto])

func buildRectangle(color: UIColor) -> UIView {
    let rectangle = UIView(frame: .zero)
    rectangle.translatesAutoresizingMaskIntoConstraints = false
    rectangle.backgroundColor = color
    rectangle.widthAnchor.constraint(equalToConstant: 100).isActive = true
    rectangle.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    return rectangle
}
```
![Adding more items on various rows and columns](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/4.png "GridLayout sample: Adding more items on various rows and columns")