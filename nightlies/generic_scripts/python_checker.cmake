# --------------------------------------------------------------------------
#                   OpenMS -- Open-Source Mass Spectrometry
# --------------------------------------------------------------------------
# Copyright The OpenMS Team -- Eberhard Karls University Tuebingen,
# ETH Zurich, and Freie Universitaet Berlin 2002-2012.
#
# This software is released under a three-clause BSD license:
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#  * Neither the name of any author or any participating institution
#    may be used to endorse or promote products derived from this software
#    without specific prior written permission.
# For a full list of authors, refer to the file AUTHORS.
# --------------------------------------------------------------------------
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL ANY OF THE AUTHORS OR THE CONTRIBUTING
# INSTITUTIONS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# --------------------------------------------------------------------------
# $Maintainer: Stephan Aiche $
# $Authors: Stephan Aiche $
# --------------------------------------------------------------------------

# python_checker.cmake
# BRIEF:  This script will execute the python_checker who reports its errors in a
#         cdash compliant way. Afterwards it will submit the results to the
#         nightly build server

# Check for required variables.
set(required_variables
	"CTEST_SOURCE_DIRECTORY;CTEST_BINARY_DIRECTORY;CTEST_BUILD_NAME")
backup_and_check_variables(required_variables)

if(NOT DEFINED CDASH_SUBMIT)
    set(CDASH_SUBMIT Off)
endif()

set(CTEST_BUILD_NAME "${CTEST_BUILD_NAME}_PythonChecker")

# now we hack our own checker into cdash
# we assume here that all tests have been build/run already
macro(CTEST_CHECKER)
	execute_process(COMMAND
		python
		${CTEST_SOURCE_DIRECTORY}/tools/PythonExtensionChecker.py
		--src_path
		${CTEST_SOURCE_DIRECTORY}
		--bin_path
		${CTEST_BINARY_DIRECTORY}
		--ignore-file
		${CTEST_SOURCE_DIRECTORY}/tools/pychecker_ignore.yaml
		--output
		xml
		OUTPUT_FILE
		${CTEST_BINARY_DIRECTORY}/pychecker.log
		WORKING_DIRECTORY
		${CTEST_SOURCE_DIRECTORY})

	safe_message("Finished checker with log in ${CHECKER_LOG}")
endmacro()

# test again and execute checker, use Track to specify Track (Dart2) / Build group (Dart1)
# in CDash
ctest_start(Nightly TRACK PyOpenMS)

# In version 3.1.0, CTEST_UPDATE_VERSION_ONLY was introduced.
# With this we can use the Jenkins Git plugin for the checkout and only get the version for CDash
# Otherwise skip update completely
if(NOT "${CMAKE_VERSION}" VERSION_LESS 3.1.0)
 ctest_update(SOURCE "${CTEST_SOURCE_DIRECTORY}" CTEST_UPDATE_VERSION_ONLY)
endif()

# ensure that we have the doxygen xml files. WHY??
ctest_build(BUILD "${CTEST_BINARY_DIRECTORY}" TARGET "doc_xml")
ctest_test(BUILD "${CTEST_BINARY_DIRECTORY}")
# uses the macro in the beginning of the file.
ctest_checker()

if(CDASH_SUBMIT)
  ctest_submit(PARTS Configure Build Test)
endif()

restore_variables(required_variables)
