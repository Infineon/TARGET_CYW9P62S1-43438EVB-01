################################################################################
# \file CYW9P62S1-43438EVB-01.mk
#
# \brief
# Define the CYW9P62S1-43438EVB-01 target.
#
################################################################################
# \copyright
# Copyright 2019-2021 Cypress Semiconductor Corporation (an Infineon company) or
# an affiliate of Cypress Semiconductor Corporation
#
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
################################################################################

ifeq ($(WHICHFILE),true)
$(info Processing $(lastword $(MAKEFILE_LIST)))
endif

# Set the default build recipe for this board if not set by the user
include $(dir $(lastword $(MAKEFILE_LIST)))/locate_recipe.mk

# MCU device selection
#    Changing the device should be done using "make bsp" or "make update_bsp" with the "DEVICE_GEN"
#    variable set to the new MCU. If you change the device manually here you must also update the
#    design.modus file and re-run the device configurator.
DEVICE:=CY8C6247BZI-D54
# Additional devices on the board
#    If you change the additional device here you must also update the design.modus file and re-run
#    the device configurator. You may also need to update the COMPONENT variable to include the
#    correct Wi-Fi and Bluetooth firmware.
ADDITIONAL_DEVICES:=CYW43438KUBG
# Default target core to CM4 if not already set
CORE?=CM4
# Basic architecture specific components
COMPONENTS+=$(TARGET) CAT1 CAT1A

ifeq ($(CORE),CM4)
# Additional components supported by the target
# 4343W is deliberately used even though this board has a radio in the 43438 family. This is
# because the two radios use the same firmware, so WHD 2.0 and higher only ship a single
# copy under the 4343W component.
COMPONENTS+=CM0P_SLEEP BSP_DESIGN_MODUS PSOC6HAL UDB_SDIO_P2 4343W AW-CU427-P HCI-UART
# Use CyHAL & UDB based SDIO
DEFINES+=CY_USING_HAL CYHAL_UDB_SDIO
endif
