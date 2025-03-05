using IntelliCook.AppController.Api.Models.RecipeSearch.UserProfile;
using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.SetUserProfile;

public class SetUserProfilePostResponseModel
{
    [Required] public UserProfileVeggieIdentityModel VeggieIdentity { get; set; }
    [Required] public IEnumerable<string> Prefer { get; set; }
    [Required] public IEnumerable<string> Dislike { get; set; }
}