# AMD ROCm for Slackware

These scripts are used to build AMD ROCm version 7.x on Slackware 15 x86_64 current tree.

These are the scripts for version 7.2.1.
Precompiled packages are available at my repository: [ROCm for Slackware](https://www.ixip.net/rocm)

1. Install required packages

A few packages need to be installed, and all of them are required.
They are located in the 3rd subdirectory.

2. Create Python virtual environment

```bash
    python3 -m venv virtualenv
    source virtualenv/bin/activate
    pip3 install -r python-requirements
```

## Fetching sources

Get the source codes using the fetch-sources.sh script.
The main idea is to keep the source trees locally on your machine, so that with the next
release you only fetch the deltas instead of downloading the entire trees again.


Follow the build order in file BUILDORDER.md

>[!NOTE]
>
> The compilation process usually takes around 4 days if you build the composable kernel package.
> Without it, expect about 2.5 days, assuming no errors occur.

### Packages that do not build

A few ROCm packages fail to compile for various reasons.

These packages are:
```
rocprofiler-systems
```

>[!NOTE]
>
> Since the Slackware current tree is updated quite frequently, if a library stops working,
> it is sufficient to recompile only rocmprofile-register.


### Allow overriding ROCM_BRANCH for custom builds

The upstream rocMLIR repository does not provide release tags for some versions due to lack of changes. 
Add support for overriding ROCM_BRANCH to allow building against custom branches or commits (e.g., ROCM_BRANCH=7.2.0).

```
ROCM_BRANCH=7.2.0 ./rocmlir.SlackBuild
```

Have fun and cheers,
Condor

