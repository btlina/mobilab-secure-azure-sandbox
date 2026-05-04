What is RBAC

Role-Based Access Control (RBAC) in Azure is a mechanism used to control access to resources based on roles assigned to users, groups, or identities.

It defines:

Who can do what on which resource
Core Components of RBAC

RBAC is based on three elements:

1. Security Principal

The identity requesting access:

User (e.g., lina@mobilabsolutions.com)
Group
Service Principal
Managed Identity (used by applications)
2. Role Definition

The set of permissions:

Examples:

Reader        → read-only access
Contributor   → create and modify resources
Owner         → full access including RBAC assignment
AcrPull       → pull images from Azure Container Registry
3. Scope

Where the role applies:

Subscription
Resource Group
Specific Resource (e.g., ACR)
RBAC in This Project

In this project, RBAC was required for secure container deployment.

Scenario

The application was deployed using:

Azure App Service + Docker container from ACR

The App Service needed permission to pull the container image.

Correct Architecture

The recommended secure approach is:

App Service → Managed Identity → AcrPull role → ACR

This avoids:

Hardcoding usernames/passwords
Storing secrets in configuration
Issue Encountered

The App Service failed with:

ImagePullUnauthorizedFailure

Root cause:

The Managed Identity did not have the AcrPull role on ACR
Attempted Fix

The correct command:

az role assignment create \
  --assignee <principalId> \
  --role AcrPull \
  --scope <ACR_ID>
Blocker

The operation failed with:

AuthorizationFailed

Reason:

The current user does not have permission to assign roles
(Microsoft.Authorization/roleAssignments/write)
Required Action

In a real environment, this must be done by a user with sufficient permissions:

Owner or User Access Administrator

They would assign:

Role: AcrPull
Principal: App Service Managed Identity
Scope: Azure Container Registry
Key Takeaways
RBAC enforces least privilege access
Applications should use Managed Identity instead of credentials
Permission boundaries are enforced even for developers
Some operations require higher-level access (admin role assignment)
Conclusion

The deployment architecture was correct, but the implementation was blocked due to RBAC restrictions.

This reflects real enterprise environments where security policies limit direct access and require coordination with platform or security teams.