# AMD ROCm for Slackware

These scripts are used to build AMD ROCm on Slackware 15 x86_64 current tree.

1. Install required packages

A few packages need to be installed, and all of them are required.
They are located in the 3rd subdirectory.

2. Create Python virtual environment

```bash
    python3 -m venv virtualenv
    source virtualenv/bin/activate
    pip3 install -r python-requirements
```

Follow the build order in file BUILDORDER.md

>[!NOTE]
>
> The compilation process usually takes around 4 days if you build the composable kernel package.
> Without it, expect about 2.5 days, assuming no errors occur.

## Packages that do not build

A few ROCm packages fail to compile for various reasons.

These packages are:
```
none
```


Have fun and cheers,
Condor

