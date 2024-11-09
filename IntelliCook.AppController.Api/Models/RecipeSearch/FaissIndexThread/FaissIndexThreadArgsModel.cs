using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.FaissIndexThread;

public class FaissIndexThreadArgsModel
{
    [Required] public uint Count { get; set; }

    [Required] public string Model { get; set; }

    [Required] public string Path { get; set; }
}