namespace IntelliCook.AppController.Api.Models;

public class ProblemDetailsModel
{
    public new string? Type { get; set; }

    public new string? Title { get; set; }

    public new int? Status { get; set; }

    public new string? Detail { get; set; }

    public new string? Instance { get; set; }

    public new string? TraceId { get; set; }
}

public class ValidationProblemDetailsModel : ProblemDetailsModel
{
    public IDictionary<string, ICollection<string>>? Errors { get; set; }
}