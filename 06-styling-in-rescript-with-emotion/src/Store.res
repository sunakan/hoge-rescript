open Belt

type recipe = {
  title: string,
  ingredients: string,
  instructions: string,
  tags: array<string>,
}

// Map Key: string, Value: recipe
// Map Key: string, Value: array<string>
type state = {
  recipes: Map.String.t<recipe>,
  tags: Map.String.t<array<string>>,
}
// ↑↑↑↑↑↑↑↑
// ややこしいのは、レシピ自体が複数のTagsを持つし
// 全体としても複数のTagsを持つ
// しかし、それぞれは別で扱う

// Initialize for reducer
let initialState: state = {
  recipes: Map.String.empty,
  tags: Map.String.empty,
}

// 2 type action
type action =
  | AddRecipe({title: string, ingredients: string, instructions: string})
  | AddTag({recipeTitle: string, tag: string})

// ↓↓↓↓↓↓↓↓これがreducer
// React.useReducer(Store.reducer, Store.initialState)
// 的な感じでやる
//
// Map.String.set(既存, 追加key, 追加value)
let reducer = (state: state, action: action) => {
  switch action {
  | AddRecipe({title, ingredients, instructions}) => {
      recipes: Map.String.set(
        state.recipes,
        title,
        {title: title, ingredients: ingredients, instructions: instructions, tags: []},
      ),
      tags: state.tags,
    }
  | AddTag({recipeTitle, tag}) => {
      let recipeOption = state.recipes->Map.String.get(recipeTitle)
      switch recipeOption {
      | Some(recipe) => {
          let recipeTags = recipe.tags->Array.concat([tag])
          let recipes = state.recipes->Map.String.set(recipe.title, {...recipe, tags: recipeTags})
          let tags = state.tags->Map.String.update(tag, taggedRecipesOption =>
            switch taggedRecipesOption {
            | None => Some([recipe.title])
            | Some(taggedRecipes) => Some(taggedRecipes->Array.concat([recipe.title]))
            }
          )
          {
            recipes: recipes,
            tags: tags,
          }
        }
      | None => state
      }
    }
  }
}
// ↑↑↑↑↑↑↑↑
// Option.flatmap と Option.map を使えばもっと綺麗に書ける
// 一旦これで
