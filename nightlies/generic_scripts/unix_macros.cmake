## Unix specific compiler selector macro. Takes identifier as given in compilers.cmake.
## e.g. needs the variables "COMPILER_IDENTIFIER;C_COMPILER;CXX_COMPILER" prefixed with a common compiler description.
macro(select_compiler compiler_prefix)
  safe_message("Selecting compiler: ${compiler_prefix}")
  set(compiler_variables "COMPILER_IDENTIFIER;C_COMPILER;CXX_COMPILER")
  foreach(compiler_variable IN LISTS compiler_variables)
    if(DEFINED ${compiler_prefix}_${compiler_variable})
      if(TEST_MACROS_DEBUG)
        safe_message("Setting ${compiler_variable} -> ${${compiler_prefix}_${compiler_variable}}")
      endif(TEST_MACROS_DEBUG)
      set( ${compiler_variable} "${${compiler_prefix}_${compiler_variable}}")
    else()
      safe_message(FATAL_ERROR "No compiler ${compiler_prefix} found")
    endif()
  endforeach()
endmacro(select_compiler compiler_prefix)