# Autogenerated wrapper script for Cliquer_jll for x86_64-linux-musl
export libcliquer

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libcliquer`
const libcliquer_splitpath = ["lib", "libcliquer.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libcliquer_path = ""

# libcliquer-specific global declaration
# This will be filled out by __init__()
libcliquer_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libcliquer = "libcliquer.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Cliquer")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libcliquer_path = normpath(joinpath(artifact_dir, libcliquer_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libcliquer_handle = dlopen(libcliquer_path)
    push!(LIBPATH_list, dirname(libcliquer_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')
end  # __init__()

