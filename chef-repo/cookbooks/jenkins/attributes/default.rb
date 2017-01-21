default['java']['install_flavor']='oracle'
default['java']['jdk_version']='8'
default['java']['oracle']['accept_oracle_download_terms'] = true

case node['platform']
        when 'ubuntu', 'debian'
                default['installation']['appserver']='tomcat7'
                default['appserver']['additionalPackages']='tomcat7-admin'
                default['appserver']['userauthfile']='/etc/tomcat7/tomcat-users.xml'
                default['appserver']['warlocation']='/var/lib/tomcat7/webapps/jenkins.war'

        when 'rhel', 'centos', 'fedora'
                default['installation']['appserver']='tomcat6'
                default['appserver']['additionalPackages']=['tomcat6-webapps', 'tomcat6-admin-webapps', 'tomcat6-docs-webapp', 'tomcat6-javadoc']
                default['appserver']['userauthfile']='/etc/tomcat6/tomcat-users.xml'
               default['appserver']['warlocation']='/var/lib/tomcat6/webapps/jenkins.war'
end
