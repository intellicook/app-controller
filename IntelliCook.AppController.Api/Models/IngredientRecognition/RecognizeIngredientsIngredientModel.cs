using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.IngredientRecognition;

public class RecognizeIngredientsIngredientModel
{
    [Required] public string Name { get; set; }
    [Required] public float X { get; set; }
    [Required] public float Y { get; set; }
    [Required] public float Width { get; set; }
    [Required] public float Height { get; set; }
}