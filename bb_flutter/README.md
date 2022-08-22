# Beauty Booking Client App

A flutter application supporting client side for booking application.

## Naming Conventions

- Navigatable Pages Naming and Structure

```
class [PageName]Page extends StatelessWidget{
    static navigationBuilder(Args... args) => _NavigationArgs();
}
```
### Widget Names

Use logical names for widgets, do not use any generic postfixes(using class names, etc ...)

for example do not postfix all widgets usiing name Widget

`Bad -> ListViewWidget();`\
`Good -> ListView();`

### Passing Params

Always use curly braces when passing parameters

`Bad -> SomeConstructor(P1 p1, P2 p2);`\
`Good -> SomeConstructor({P1 p1, P2 p2})`

