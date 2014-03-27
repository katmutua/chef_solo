package 'ntp'
package 'sysstat'
package 'apache2'

directory '/mnt/data_joliss'

mount '/mnt/data_joliss' do
	action [:mount, :enable]
	device 'data_joliss'
	device_type :label
	options 'noatime,errors=remount-ro'
end

hostname = 0.0.0.0:8000

file '/etc/hostname' do
	content "#{hostanme}\n"
end

service 'hostname' do
	action :restart
end

file '/etc/hosts' do
	content "127.0.0.1 localhost #{hostname}\n"
end


cookbook_file '/etc/apache2/apache2.conf'

service 'apache2' do
	action :restart
end

