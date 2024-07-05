using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Options;

public class ApiOptions : IOptionsBase
{
    public static string SectionKey => "Api";

    public required string Title { get; init; }

    public required string Description { get; init; }

    [Range(0, int.MaxValue, ErrorMessage = "Major version number must be non-negative")]
    public required int MajorVersion { get; init; }

    [Range(0, int.MaxValue, ErrorMessage = "Minor version number must be non-negative")]
    public required int MinorVersion { get; init; }

    public string VersionString => MinorVersion switch
    {
        0 => $"v{MajorVersion}",
        _ => $"v{MajorVersion}.{MinorVersion}"
    };
}