using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.UserProfile;

public class UserProfileGetResponseModel
{
    [Required] public UserProfileVeggieIdentityModel VeggieIdentity { get; set; }
    [Required] public IEnumerable<string> Prefer { get; set; }
    [Required] public IEnumerable<string> Dislike { get; set; }
}