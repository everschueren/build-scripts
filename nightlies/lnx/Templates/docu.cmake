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
# $Authors: Stephan Aiche $
# --------------------------------------------------------------------------

## BRIEF: This script add an extra CTEST_BUILD to the test script, that
#         includes building the documentation and uploading it to a
#         specified destination.

# Check for required variables.
set(required_variables "CTEST_SOURCE_DIRECTORY;CTEST_BINARY_DIRECTORY;CTEST_BUILD_NAME;DOCU_TARGET_PATH")

backup_and_check_variables(required_variables)

## (re)define build name and test directories
SET (CTEST_BUILD_NAME "${CTEST_BUILD_NAME}_Documentation")

CTEST_START (Nightly)
CTEST_BUILD (BUILD TARGET doc APPEND)
CTEST_BUILD (BUILD TARGET doc_tutorials APPEND)
CTEST_SUBMIT (PARTS Build) # lets see if this works

# and now the hard work
if(EXISTS "${CTEST_BINARY_DIRECTORY}/doc/index.html")
  message(STATUS "cmake -E remove_directory ${DOCU_TARGET_PATH}${OPENMS_BUILDNAME_PREFIX}documentation/")
  execute_process(
    COMMAND cmake -E remove_directory ${DOCU_TARGET_PATH}${OPENMS_BUILDNAME_PREFIX}documentation/
    WORKING_DIRECTORY ${CTEST_BINARY_DIRECTORY}
  )

  message(STATUS "cmake -E copy_directory ${CTEST_BINARY_DIRECTORY}/doc/ ${DOCU_TARGET_PATH}${OPENMS_BUILDNAME_PREFIX}documentation/")
  execute_process(
    COMMAND cmake -E copy_directory ${CTEST_BINARY_DIRECTORY}/doc/ ${DOCU_TARGET_PATH}${OPENMS_BUILDNAME_PREFIX}documentation/
    WORKING_DIRECTORY ${CTEST_BINARY_DIRECTORY}
  )
endif()

restore_variables(required_variables)
