# ------------------------------------------------------------
# script:  /usr/lib/ruby/vendor_ruby/facter/readsincpuppetconfig.rb
# Author:  Esteban M. Navas Martín
# Date:    27-04-2017
# Ver:     27-04-2017
#
# Purpose: Read config file /usr/share/linex-ubuntu-puppet/sincpuppet.default and add variables to facter

# Copyright (c) 2012-2017 Esteban M. Navas Martín <algodelinux@gmail.com>. All rights reserved.
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.

#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   You should have received a copy of the GNU General Public License
#   along with this program. If not, see <http://www.gnu.org/licenses/>.


if File.exists?("/usr/share/linex-ubuntu-puppet/sincpuppet.default")
   File.open("/usr/share/linex-ubuntu-puppet/sincpuppet.default").each do |line|
      var = nil
      value = nil

      var = "puppet_" + $1 and val = $2 if line =~ /^(\S+)\s*=\s*"([^"]+)/

      if var != nil && val != nil
         Facter.add(var) do
            setcode { val }
         end
      end
   end
end
####
