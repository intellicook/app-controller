using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.IngredientRecognition;

public class SelectIngredientPostRequest
{
    [Required] public int X { get; set; }
    [Required] public int Y { get; set; }
}