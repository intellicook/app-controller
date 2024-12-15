using IntelliCook.AppController.Api.Models.IngredientRecognition;
using IntelliCook.IngredientRecognition.Client;

namespace IntelliCook.AppController.Api.Extensions;

public static class IngredientRecognitionContractExtensions
{
    #region RecognizeIngredients

    public static RecognizeIngredientsIngredientModel ToIngredientModel(
        this RecognizeIngredientsIngredient ingredient
    )
    {
        return new RecognizeIngredientsIngredientModel
        {
            Name = ingredient.Name,
            X = ingredient.X,
            Y = ingredient.Y,
            Width = ingredient.Width,
            Height = ingredient.Height
        };
    }

    public static RecognizeIngredientsPostResponseModel ToPostResponseModel(
        this RecognizeIngredientsResponse response
    )
    {
        return new RecognizeIngredientsPostResponseModel
        {
            Ingredients = response.Ingredients.Select(i => i.ToIngredientModel())
        };
    }

    #endregion
}