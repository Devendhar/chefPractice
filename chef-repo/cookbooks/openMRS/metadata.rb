name 'openMRS'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures openMRS'
long_description 'Installs/Configures openMRS'
version '0.1.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/openMRS/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/openMRS' if respond_to?(:source_url)

depends	'selinux', '~>0.9.0'
depends 'mysql', '~>8.2.0'

#use the database cookbook from Chef Supermarket, which enables us to configure MySQL database instances.The database cookbook uses the mysql2 Ruby library (a Ruby library is often packaged as a gem) to connect to MySQL. To install this gem, we'll use the mysql2_chef_gem cookbook.

depends 'mysql2_chef_gem', '~>1.1.0'
depends 'database', '~>6.1.1'
