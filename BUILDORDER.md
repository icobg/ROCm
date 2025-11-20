
# ROCm Build Order

Here is the recommended build order for AMD ROCm on Slackware.

>[!NOTE]
>
> The order may vary slightly between versions, as new packages may be added or removed.

I have removed numbering for clarity.

## Core Packages

rocm-core

rocm-cmake

rocm-llvm
rocm-device-libs
rocm-comgr
HIPCC
rocprofiler-register
ROCR-Runtime
rocminfo
hip-runtime-amd
rocRAND
hipRAND
rocFFT
hipBLAS-common
roctracer
rocm_smi_lib
openmp
hipBLASLt
amdsmi
rocBLAS
rocPRIM
rocSPARSE
hipSPARSE
ROCmValidationSuite
HIPIFY
rccl
hipFFT
clr
ROCdbgapi
aqlprofile
rocprofiler
rocDecode
rocJPEG
rocprofiler-sdk
rocprofiler-system
half
composable-kernel
rocMLIR
rocSOLVER
hipBLAS
rocThrust
MIOpen
rocALUTION
hipCUB
hipSOLVER
ROCgdb
hipfort
rocm_bandwidth_test
AMDMIGraphX
hipTensor
rocWMMA
rpp
transferbench
MIVisionX
rocAL
rdc
hipDNN

## Notes

- Follow this order carefully to avoid missing dependencies.
- Some packages may require **manual intervention**.
- Building the full ROCm stack can take **multiple days** depending on your system.
