using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.FaissIndexThread;

public class FaissIndexThreadGetResponseModel
{
    /// <summary>
    ///     Faiss index thread status.
    /// </summary>
    [Required]
    public FaissIndexThreadStatusModel Status { get; set; }

    /// <summary>
    ///     Faiss index thread arguments. This field is only present if the status is not Uninitialized.
    /// </summary>
    public FaissIndexThreadArgsModel? Args { get; set; }
}