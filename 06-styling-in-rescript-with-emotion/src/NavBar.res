// コンポーネント毎のStyleかぁ。。？
module Styles = {
  open CssJs
  let navButton = selected =>
    style(. [
      backgroundColor(
        if selected {
          "656565"->hex
        } else {
          "efefef"->hex
        },
      ),
      padding(1.0->ex),
      cursor(#pointer),
    ])
  let navBar = style(. [
    display(#flex),
    justifyContent(#center),
    borderBottom(1->px, #solid, "656565"->hex),
  ])
}
module NavButton = {
  // name: button view text
  // selected: selected button
  // linkTo: url
  @react.component
  let make = (~name: string, ~selected: string, ~linkTo: string) => {
    <div
      className={Styles.navButton(selected === name)}
      onClick={_ => RescriptReactRouter.push(linkTo)}>
      {React.string(name)}
    </div>
  }
}

@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()
  let selected = switch url.path {
  | list{"recipes", ..._} => "Recipes"
  | list{"tags", ..._} => "Tags"
  | _ => "Home"
  }
  <div className=Styles.navBar>
    <NavButton name="Home" selected={selected} linkTo="/" />
    <NavButton name="Tags" selected={selected} linkTo="/tags" />
    <NavButton name="Recipes" selected={selected} linkTo="/recipes/add" />
  </div>
}
