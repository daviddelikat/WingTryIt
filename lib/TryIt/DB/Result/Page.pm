package TryIt::DB::Result::Page;

use Moose;
use Wing::Perl;
use Ouch;
extends 'Wing::DB::Result';

with 'Wing::Role::Result::Field';
#with 'Wing::Role::Result::PrivilegeField';
#with 'Wing::Role::Result::Child';
#with 'Wing::Role::Result::Parent';

__PACKAGE__->wing_fields(
  name => {
    dbic 		=> { data_type => 'varchar', size => 60, is_nullable => 0 },
    view		=> 'public',
    edit		=> 'required',
  },
  content => {
    dbic 		=> { data_type => 'text', size => 60, is_nullable => 0 },
    view		=> 'public',
    edit		=> 'required',
  },
##Add more fields here
);

#__PACKAGE__->wing_privilege_fields(
###Add privileged fields here
#);
#
#__PACKAGE__->wing_children(
###Add children here
#);
#
#__PACKAGE__->wing_parent(
###Add parents here
#);



__PACKAGE__->wing_finalize_class( table_name => 'pages');

no Moose;
__PACKAGE__->meta->make_immutable(inline_constructor => 0);

