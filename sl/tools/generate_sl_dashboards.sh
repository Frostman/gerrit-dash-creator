#!/bin/sh

# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

output_directory=sl/generated/

if [[ -e $output_directory ]]; then
    rm -f $output_directory/*
else
    mkdir -p $output_directory
fi

echo "<h1>SL OpenStack Gerrit Dashboards</h1>" > $output_directory/index.html

for dashboard in $(find sl/dashboards -name '*.dash' | sort); do
    output=$(basename $dashboard .dash)
    python gerrit-dash-creator --template-directory sl/templates \
    --template sl-link.html $dashboard >> $output_directory/index.html
done
