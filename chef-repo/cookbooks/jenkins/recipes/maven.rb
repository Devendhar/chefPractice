remote_file '/opt/maven.tar.gz' do
	source 'http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz'
	action :create
end


execute '/opt/maven.tar.gz' do
	command 'tar -xvzf /opt/maven.tar.gz -C /opt'
end

link '/opt/maven' do 
	to '/opt/apache-maven-3.3.9'
	link_type :symbolic
end

template '/etc/profile.d/maven.sh' do
	source 'maven.erb'
end

#execute '/etc/profile.d/maven.sh' do
#	command 'source /etc/profile.d/maven.sh'
#end
