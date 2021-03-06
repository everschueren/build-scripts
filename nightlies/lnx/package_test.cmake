# Check for required variables.
set(required_variables "CTEST_SOURCE_DIRECTORY;CTEST_BINARY_DIRECTORY;INITIAL_CACHE;CTEST_BUILD_NAME")

backup_and_check_variables(required_variables)

SET (BUNDLE_NAME "OpenMS-1.10.0-Linux.deb")
SET (TARGET_NAME "OpenMS-1.10.0-debian_squeeze-x86_64.deb")
SET (CTEST_BUILD_NAME "${CTEST_BUILD_NAME}_Package")

# update the source tree
message("Executing ${CMAKE_COMMAND} -D PACKAGE_TYPE=dmg -D LATEX_COMPILER:FILEPATH=/usr/texbin/latex  -D PDFLATEX_COMPILER:FILEPATH=/usr/texbin/pdflatex ${CTEST_SOURCE_DIRECTORY}")
message("Working directory is ${CTEST_BINARY_DIRECTORY}")

execute_process(
	COMMAND ${CMAKE_COMMAND} -D PACKAGE_TYPE=deb -D LATEX_COMPILER:FILEPATH=/usr/bin/latex -D PDFLATEX_COMPILER:FILEPATH=/usr/bin/pdflatex ${CTEST_SOURCE_DIRECTORY}
	WORKING_DIRECTORY "${CTEST_BINARY_DIRECTORY}/"
	RESULT_VARIABLE RECONFIGURE_FOR_PACKAGE_BUILD
	OUTPUT_VARIABLE RECONFIGURE_FOR_PACKAGE_BUILD_OUT
	ERROR_VARIABLE RECONFIGURE_FOR_PACKAGE_BUILD_OUT  
)
  
if( NOT RECONFIGURE_FOR_PACKAGE_BUILD EQUAL 0)
	message("Could not reconfigure ${CTEST_BINARY_DIRECTORY} for package build")
	message(FATAL_ERROR "reconfigure resulted in: ${RECONFIGURE_FOR_PACKAGE_BUILD}")
endif()

SET( $ENV{PATH} "${CTEST_BINARY_DIRECTORY}/bin:$ENV{PATH}" )

# build the package and submit the results to cdash  
CTEST_START   (Nightly)
CTEST_BUILD   (TARGET doc)
CTEST_BUILD   (TARGET doc_tutorials APPEND)
CTEST_BUILD   (TARGET package APPEND)
CTEST_SUBMIT  (PARTS Build)

# copy package to destination
file(RENAME ${CTEST_BINARY_DIRECTORY}/${BUNDLE_NAME} ${CTEST_BINARY_DIRECTORY}/${TARGET_NAME})
file(
		COPY ${CTEST_BINARY_DIRECTORY}/${TARGET_NAME}
		DESTINATION ${PACKAGE_TARGET_PATH}
)

restore_variables(required_variables)