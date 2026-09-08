# Security Policy

## Reporting a Vulnerability

Please do not publish exploitable security issues in public issues before a fix is available.

If you discover a security problem in the agent framework, report it privately to the repository owner through an appropriate private GitHub contact channel when available.

Include:

- affected file or workflow,
- impact,
- reproduction steps,
- suggested mitigation if known.

## Scope

Security concerns may include instructions that could cause:

- secret exposure,
- unsafe credential handling,
- authentication/authorization bypass recommendations,
- destructive Git behavior,
- unsafe file handling,
- incorrect billing or concurrency patterns,
- cross-user data access,
- insecure defaults.

The framework itself is instruction-based. Projects using it remain responsible for their own application security, dependency security, infrastructure, and deployment configuration.
