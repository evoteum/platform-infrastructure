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


This repository provisions the AWS-based shared platform resources for the Evoteum
estate: ECS clusters, application load balancers, networking, and ACM certificates.

The platform has been migrated onto a self-hosted, bare-metal Kubernetes cluster, with
Cloudflare Tunnels handling ingress instead of an ALB and public DNS/ACM certificates.
As a result, this repository currently provisions no live AWS infrastructure; the
ECS/ALB/VPC resources it previously managed have been destroyed and removed from
configuration, but it remains the intended home for any shared AWS resources should the
estate need them again.


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

As deployment is centrally automated, security considerations are also managed
centrally. This ensures improvements are deployed as swiftly as everything else.

## Background
[//]: # (OPTIONAL)
[//]: # (Explain the motivation and abstract dependencies for this repo)

The vision is simple: developers should not need to care how their application is
running, only that their service is securely reachable at its configured domain.

That golden path is now delivered by a self-hosted, bare-metal Kubernetes cluster
rather than the AWS ECS/ALB stack this repository used to manage. Ingress and TLS are
handled by Cloudflare Tunnels, removing the need for a public-facing load balancer,
VPC, or ACM certificate.

This repository's OpenTofu configuration currently provisions nothing: the ECS
clusters, load balancers, networking, and certificates it used to manage have been
decommissioned. It remains the shared-infrastructure repository for the estate, ready
to provision AWS resources again if a future need arises.



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
