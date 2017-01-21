case node['platform']
        when 'ubuntu', 'debian'
                default['installation']['appserver']='tomcat7'
                default['appserver']['additionalPackages']='tomcat7-admin'
                default['appserver']['userauthfile']='/etc/tomcat7/tomcat-users.xml'
                default['appserver']['warlocation']='/var/lib/tomcat7/webapps/benefits.war'

        when 'rhel', 'centos', 'fedora'
                default['installation']['appserver']='tomcat6'
                default['appserver']['additionalPackages']=['tomcat6-webapps', 'tomcat6-admin-webapps', 'tomcat6-docs-webapp', 'tomcat6-javadoc']
                default['appserver']['userauthfile']='/etc/tomcat6/tomcat-users.xml'
                default['appserver']['warlocation']='/var/lib/tomcat6/webapps/openmrs.war'
end


default['openmrs']['database']['dbname']='my_company'
default['openmrs']['database']['host']='127.0.0.1'
default['openmrs']['database']['username']='root'
default['openmrs']['database']['password']='redhat'

default['openmrs']['database']['admin_username']='admin'
default['openmrs']['database']['admin_password']='admin'

