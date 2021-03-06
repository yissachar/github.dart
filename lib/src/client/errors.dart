part of github.client;

/**
 * A error from [GitHub].
 */
class GitHubError {
  final String message;
  final String apiUrl;
  final GitHub github;
  final Object source;
  
  GitHubError(this.github, this.message, {this.apiUrl, this.source});
  
  @override
  String toString() => "GitHub Error: ${message}";
}

class NotFound extends GitHubError {
  NotFound(GitHub github, String msg) : super(github, msg);
}

class RepositoryNotFound extends NotFound {
  RepositoryNotFound(GitHub github, String repo) : super(github, "Repository Not Found: ${repo}");
}

class UserNotFound extends NotFound {
  UserNotFound(GitHub github, String user) : super(github, "User Not Found: ${user}");
}

class OrganizationNotFound extends NotFound {
  OrganizationNotFound(GitHub github, String organization) : super(github, "Organization Not Found: ${organization}");
}

class TeamNotFound extends NotFound {
  TeamNotFound(GitHub github, int id) : super(github, "Team Not Found: ${id}");
}

class AccessForbidden extends GitHubError {
  AccessForbidden(GitHub github) : super(github, "Access Forbbidden");
}

class UnknownError extends GitHubError {
  UnknownError(GitHub github) : super(github, "Unknown Error");
}

class NotAuthenticated extends GitHubError {
  NotAuthenticated(GitHub github) : super(github, "Client not Authenticated");
}