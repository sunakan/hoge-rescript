// RescriptReactRouter
//   @rescript/reactで提供されているモジュール
@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  let (state, dispatch) = React.useReducer(Store.reducer, Store.initialState)

  // レンダリング後に毎回にcallされる
  // dispatchが2回callされる
  // 2種類のActionがcallされる
  React.useEffect1(() => {
    dispatch(
      Store.AddRecipe({
        title: "Bread",
        ingredients: "flour, salt, water, yeast",
        instructions: "Mix, let rise overnight, bake at 400",
      }),
    )
    dispatch(Store.AddTag({recipeTitle: "Bread", tag: "carbs"}))
    None
  }, [dispatch])
  // ↑↑↑↑↑↑↑dispatchを監視, これ意味ある?

  let component = switch url.path {
  | list{"recipes", "add"} => <div> {React.string("Add Recipe")} </div>
  | list{"recipes", title} => <div> {<ViewRecipe state title />} </div>
  | list{"tags"} => <AllTags tags={state.tags} />
  | list{} => <div> {React.string("Home page")} </div>
  | _ => <div> {React.string("Not found")} </div>
  }

  // 明示的にNavBarコンポーネントのimportは不要
  // 勝手にされる
  <div> <NavBar /> {component} </div>
}
