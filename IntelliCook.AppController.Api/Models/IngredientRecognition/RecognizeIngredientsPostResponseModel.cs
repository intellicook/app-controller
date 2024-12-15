using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.IngredientRecognition;

public class RecognizeIngredientsPostResponseModel
{
    [Required] public IEnumerable<RecognizeIngredientsIngredientModel> Ingredients { get; set; }
}