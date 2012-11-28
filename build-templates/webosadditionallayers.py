# Copyright (c) 2008 - 2012 Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Documentation:
#
# This implementation introduces the next generation build environment
# for OpenWebos. The change introduces a mechanism to add additional
# layers to the base, meta-webos, meta-oe and openembedded-core.
# The new layers contribute to the image content of WebOS.
#
# The base layers are defined in webosbaselayers.py file located in 
# the scripts directory.  A separate file, webosadditionallayers.py,
# is used to define the additional layers.  The additional layers file 
# can be located anywhere, however a template is provided in build-templates 
# directory.  Using separate configuration files provides a mechanism to 
# track the base layers independently.
#
# The files format uses python data structures to define the following:
#
# ('layer-name', integer-priority, 'URL', 'submission', 'working-dir')
#
# layers name = unique identifier, usually identical to repo name on github.
# priority    = layer priority as defined by Openembedded. Larger numbers
#               have higher priority. A value of '-1' indicates a non-layer
#               content, such as bitbake
# URL         = The git repo address for the layer, on the web. A value of ''
#               skips the download.
# submission  = Is the git information to download and identify the precise
#               content.  Submission values could be "branch=<name>" and 
#               "commit=<id>" or "tag=<label>". Omitted branch information
#               means master. Omitted commit or tag means tip of branch.
# working-dir = Alternative project directory for the git repo.
#
# The priority in this file overrides those specified in conf/layer.conf
# for each layer.
#
# The mcf scripts will always read the base layers from webosbaselayers.py file.
# On the other hand, webosadditionallayers.py is optional. It is needed only when
# additional layers are defined.
#
# exmaple:
# ./mcf -p 4 -b 5 -distro newdistro -al .  machinename
#
# To build Open WebOS, just issue a command similar to:
# ./mcf -p 4 -b 5 machinename
#
#
webos_base_layers = [
('tools', -1, 'git://somewhere.org/tools', 'branch=1.14,commit=53e6b630f', '' ),
('meta-x', 5, 'git://somewhere.org/meta-x.git', 'commit=c68caf3', ''  ),
('meta-y', 6, '' , '', '/home/project'),
]

