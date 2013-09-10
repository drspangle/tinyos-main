# Finger2IPv6 - UDP Console Based IPv6 Policy System
# Created by Daniel Smullen
# Please report bugs to: Daniel.Smullen@uoit.net
#
# Based on Finger2 - Embedded Policy System for Sensor Networks
# Created by Themistoklis Bourdenas, modified by Nidal Qwasmi
#
# Finger2IPv6 is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Finger2IPv6 is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Finger2.  If not, see <http://www.gnu.org/licenses/>.

COMPONENT=Finger2IPv6C

#Include all Finger2IPv6 source files.
PFLAGS+=-I./Headers/
PFLAGS+=-I./PlatformComponents/
PFLAGS+=-I./Finger2Components/
PFLAGS+=-I./Finger2Components/Interfaces/

#blip Extensions
####################
#Enable RPL routing.
PFLAGS += -DRPL_ROUTING -DRPL_STORING_MODE -I$(TOSDIR)/lib/net/rpl

#Derive IPv6 short addresses from the specified static IP, or from
#DHCP-derived address.
PFLAGS += -DBLIP_DERIVE_SHORTADDRS

#Specify the static IPv6 address prefix here:
#Default is: -DIN6_PREFIX=\"fec0::\"
PFLAGS += -DIN6_PREFIX=\"fec0::\"

include $(MAKERULES)
