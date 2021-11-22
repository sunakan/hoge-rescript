open Belt

@react.component
let make = (~tags: Map.String.t<array<string>>) => {
  let tagComponents =
    tags
    ->Map.String.toArray
    ->Array.map(((tag, recipes)) =>
      <div key={tag}> <h2> {React.string(tag)} </h2> <RecipeList recipes /> </div>
    )
    ->React.array
  <div> {tagComponents} </div>
}

// ↑↑↑↑↑↑↑
// tags
//   .toArray()
//   .map {([tag, recipes]) => <div>...</div>}
//   .toReactArray()
//
// tagComponentsの中身はReact.Array<React.component>となる
//
// 引数：Map<String, Array<String>>
// React.Array<React.component>に変換して
// divで囲って返している
