[//]: # (STANDARD README)
[//]: # (https://github.com/RichardLitt/standard-readme)
[//]: # (----------------------------------------------)
[//]: # (Uncomment optional sections as required)
[//]: # (----------------------------------------------)

[//]: # (Title)
[//]: # (Match repository name)
[//]: # (REQUIRED)

# platform-infrastructure

[//]: # (Banner)
[//]: # (OPTIONAL)
[//]: # (Must not have its own title)
[//]: # (Must link to local image in current repository)


[//]: # (Badges)
[//]: # (OPTIONAL)
[//]: # (Must not have its own title)


[//]: # (Short description)
[//]: # (REQUIRED)
[//]: # (An overview of the intentions of this repo)
[//]: # (Must not have its own title)
[//]: # (Must be less than 120 characters)
[//]: # (Must match GitHub's description)

Shared infrastructure for the Evoteum platform

[//]: # (Long Description)
[//]: # (OPTIONAL)
[//]: # (Must not have its own title)
[//]: # (A detailed description of the repo)


This repository contains the core infrastructure that powers the Evoteum estate. It defines and provisions the shared platform resources necessary for application deployment across all environments. These shared components include ECS clusters, application load balancers, networking, and related foundational infrastructure services.

The primary goal of this repository is to automate the golden path to deployment for all services. With minimal configuration, developers should be able to deploy their services without needing to understand the underlying infrastructure.


## Table of Contents

[//]: # (REQUIRED)
[//]: # (Delete as appropriate)

1. [Security](#security)
1. [Background](#background)
1. [Install](#install)
1. [Usage](#usage)
1. [Documentation](#documentation)
1. [Repository Configuration](#repository-configuration)
1. [Contributing](#contributing)
1. [License](#license)

## Security
[//]: # (OPTIONAL)
[//]: # (May go here if it is important to highlight security concerns.)

As deployment is centrally automated, security considerations are also managed centrally. This ensures improvements are deployed as swiftly as everything else.

## Background
[//]: # (OPTIONAL)
[//]: # (Explain the motivation and abstract dependencies for this repo)

The vision is simple: any repository that wants to be deployed should only need to declare:

```yaml
deploy: true
```

in its corresponding entry in estate-config/repos.yml, and the platform handles the rest.

This triggers:
- Allocation of ECS capacity in the relevant environment
- ALB routing and secure TLS termination
- DNS configuration and HTTPS redirection
- Health checks and secure environment injection
- Role-based access to dependent services such as DynamoDB or S3

The developer should not need to care how the application is running, only that their service is securely reachable via its configured domain.


This repository is responsible for:
- Provisioning and managing ECS clusters (one per environment)
- Provisioning and managing application load balancers
- Wiring up common networking components (VPC, subnets, security groups)
- Enabling service-specific routing, domain configuration, and certificate management
- Centralising platform-level permissions and access control

Although ECS is currently used as the deployment target, the infrastructure is designed to be cloud-agnostic and orchestration-neutral. In future, as scale demands, the platform will transition to Kubernetes, likely using an OpenStack provider. Applications opting into the golden path should not require any changes during such transitions.



## Install

[//]: # (Explain how to install the thing.)
[//]: # (OPTIONAL IF documentation repo)
[//]: # (ELSE REQUIRED)

Nothing to install.

## Usage
[//]: # (REQUIRED)
[//]: # (Explain what the thing does. Use screenshots and/or videos.)

If you are building a new service and want it to be deployable via the platform, simply:

1.	Add `deploy: true` to your repos.yml entry.
2.	Follow any additional environment variable conventions.
3.	Push your code.

The platform will _just work_ ™.

[//]: # (Extra sections)
[//]: # (OPTIONAL)
[//]: # (This should not be called "Extra Sections".)
[//]: # (This is a space for ≥0 sections to be included,)
[//]: # (each of which must have their own titles.)



## Documentation

Further documentation is in the [`docs`](docs/) directory.

## Repository Configuration

> [!WARNING]  
> This repo is controlled by OpenTofu in the [estate-repos](https://github.com/evoteum/estate-repos). repository.  
>  
> Manual configuration changes will be overwritten the next time OpenTofu runs.


[//]: # (## API)
[//]: # (OPTIONAL)
[//]: # (Describe exported functions and objects)



[//]: # (## Maintainers)
[//]: # (OPTIONAL)
[//]: # (List maintainers for this repository)
[//]: # (along with one way of contacting them - GitHub link or email.)



[//]: # (## Thanks)
[//]: # (OPTIONAL)
[//]: # (State anyone or anything that significantly)
[//]: # (helped with the development of this project)



## Contributing
[//]: # (REQUIRED)
If you need any help, please log an issue and one of our team will get back to you.

PRs are welcome.


## License
[//]: # (REQUIRED)

All our code is licenced under the AGPL-3.0. See [LICENSE](LICENSE) for more information.
