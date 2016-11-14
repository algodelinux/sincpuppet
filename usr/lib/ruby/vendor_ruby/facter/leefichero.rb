# Archivo /usr/lib/ruby/vendor_ruby/facter/leefichero.rb
# Se utiliza para leer fichero /etc/escuela2.0 y anadir variables a facter

if File.exists?("/etc/escuela2.0")
   File.open("/etc/escuela2.0").each do |line|
      var = nil
      value = nil

      var = $1 and val = $2 if line =~ /^(.+)=(.+)$/

      if var != nil && val != nil
         Facter.add(var) do
            setcode { val }
         end
      end
   end
end
####
