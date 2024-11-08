using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models;

public class ForbiddenModel
{
    [Required] public string Message { get; set; }
}